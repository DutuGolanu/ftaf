extends Node2D

var door_closed = false
var can_flash = true
var door_timer_started = false
var dreamy_timer_started = false
var at_door = false

func _ready():
	thugs.on_left_hall = true
	thugs.check_mouse_pos()
	$usa_hol_inchisa.hide()
	$DreamyClose.hide()
	if thugs.dreamy_pos >= 20:
		ambience.breathing.emit()
	if thugs.night == 1:
		if Clock.instructed_hol == false:
			Clock.show_hol_instruction()
func _process(_delta):
	if Input.is_action_pressed("flashlight"):
		if can_flash == true:
			$LuminaMica.show()
			$LuminaMare.show()
			thugs.flashing_left_hall = true
			thugs.flashed_left_hall = true
			if at_door == true:
				$DreamyClose.show()
				await get_tree().create_timer(0.5).timeout
				$DreamyClose.hide()
				dreamy.dreamy_jumpscare.emit()
			if thugs.dreamy_pos >= 15 and thugs.dreamy_pos <20:
				if thugs.dreamy_flashed == false:
					if thugs.dreamy_chance_nr == 1:
						var tween = create_tween()
						tween.tween_property($Dreamy,"position:x",2000,0.5).from_current().set_delay(1)
						thugs.dreamy_flashed = true
						await tween.finished
						thugs.dreamy_pos = 12
	else:
		$LuminaMica.hide()
		$LuminaMare.hide()
		thugs.flashing_left_hall = false
	if thugs.dreamy_pos >= 15 and thugs.dreamy_pos <20 and thugs.flashing_left_hall == true:
		if thugs.dreamy_chance_nr == 1:
			if thugs.flashing_left_hall == true:
				if thugs.jumpscaring == false:
					$Dreamy.show()
	else:
		$Dreamy.hide()
	if thugs.dreamy_pos >= 20:
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
		$usa_hol_inchisa.show()
		if at_door == true:
			if dreamy_timer_started == false:
				thugs.pause_dreamy_timer()
				dreamy_timer_started = true
			if door_timer_started == false:
				$door_timer.start()
				door_timer_started = true
				
	else:
		can_flash = true
		$usa_hol_inchisa.hide()
		door_closed = false
		$door_timer.stop()
		door_timer_started = false
		if at_door == true:
			thugs.unpause_dreamy_timer()
func _on_go_back_mouse_entered():
	Clock.hide_hol_instruction()
	Clock.instructed_hol = true
	Clock.instructed_arrow = true
	thugs.inside = true
	if thugs.flashing_left_hall == false:
		if thugs.mouse_inside_at_first == false:
			thugs.main = true
			thugs.on_left_hall = false
			trans.change_scene("res://floor_animation.tscn")
			if thugs.dreamy_pos >=15 and thugs.dreamy_pos <20:
				if thugs.flashed_left_hall == false:
					thugs.dreamy_pos = 20


func _on_go_back_mouse_exited():
	thugs.inside = false


func _on_door_timer_timeout():
	if at_door == true:
		thugs.chance_not_emitted = true
		thugs.dreamy_pos = randi_range(7,10)
		thugs.at_door = false
		ambience.stop_breathing_sounds()
	elif thugs.dreamy_pos >= 15 and thugs.dreamy_pos < 20:
		thugs.dreamy_pos = 20
