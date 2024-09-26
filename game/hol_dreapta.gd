extends Node2D

var door_closed = false
var can_flash = true
var door_timer_started = false
var at_door = false
var brandon_timer_started = false

func _ready():
	thugs.on_right_hall = true
	thugs.check_mouse_pos()
	$hol_usa_inchisa.hide()
	$Brandon_close.hide()
	if thugs.brandon_pos >= 20:
		ambience.breathing.emit()
	if thugs.night == 1:
		if Clock.instructed_hol == false:
			Clock.show_hol_instruction()
func _process(_delta):
	if Input.is_action_pressed("flashlight"):
		if can_flash == true:
			$LuminaMica.show()
			$LuminaMare.show()
			thugs.flashing_right_hall = true
			thugs.flashed_right_hall = true
			if at_door == true:
				$Brandon_close.show()
				await get_tree().create_timer(0.5).timeout
				$Brandon_close.hide()
				brandon.brandon_jumpscare.emit()
			if thugs.brandon_pos >= 15 and thugs.brandon_pos <20:
				if thugs.brandon_flashed == false:
					if thugs.brandon_chance_nr == 0:
						var tween = create_tween()
						tween.tween_property($Brandon,"position:x",280,0.5).from_current().set_delay(1)
						thugs.brandon_flashed = true
						await tween.finished
						thugs.brandon_pos = 12
	else:
		$LuminaMica.hide()
		$LuminaMare.hide()
		thugs.flashing_right_hall = false
	if thugs.brandon_pos >= 15 and thugs.brandon_pos <20 and thugs.flashing_right_hall == true:
		if thugs.brandon_chance_nr == 0:
			if thugs.flashing_right_hall == true:
				if thugs.jumpscaring == false:
					$Brandon.show()
	else:
		$Brandon.hide()
	if thugs.brandon_pos >= 20:
		at_door = true
	else:
		at_door = false
	if thugs.inside == false:
		thugs.mouse_inside_at_first = false
	if Input.is_action_pressed("close_door"):
		$LuminaMica.show()
		$LuminaMare.hide()
		can_flash = false
		door_closed = true
		$hol_usa_inchisa.show()
		if at_door == true:
			if brandon_timer_started == false:
				thugs.pause_brandon_timer()
				brandon_timer_started = true
			if door_timer_started == false:
				$door_timer.start()
				door_timer_started = true
	else:
		can_flash = true
		door_closed = false
		$hol_usa_inchisa.hide()
		$door_timer.stop()
		door_timer_started = false
		if at_door == true:
			thugs.unpause_brandon_timer()
func _on_go_back_mouse_entered():
	Clock.hide_hol_instruction()
	Clock.instructed_hol = true
	Clock.instructed_arrow = true
	thugs.inside = true
	if thugs.flashing_right_hall == false:
		if thugs.mouse_inside_at_first == false:
			thugs.main = true
			thugs.on_right_hall = false
			trans.change_scene("res://floor_animation.tscn")
			if thugs.brandon_pos >=15 and thugs.brandon_pos <20:
				if thugs.flashed_right_hall == false:
					thugs.brandon_pos = 20

func _on_go_back_mouse_exited():
	thugs.inside = false


func _on_door_timer_timeout():
	if at_door == true:
		thugs.chance_not_emitted = true
		thugs.brandon_pos = randi_range(7,10)
		at_door =false
		ambience.stop_breathing_sounds()
	elif thugs.brandon_pos >= 15 and thugs.brandon_pos < 20:
		thugs.brandon_pos = 20
