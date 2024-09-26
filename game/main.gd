extends Node2D

var on_dulap = false
var right_side_entered = false
var left_side_entered = false
var cursor_scene = preload("res://cursor.tscn")
var cursor = cursor_scene.instantiate()
var instructed_door = false

func _ready():
	hide_instructions()
	new_game()
	Clock.show()
	if instructed_door == false:
		$instructions.modulate.a8 = 80
		$Instructions.modulate.a8 = 80
		$instructions2.modulate.a8 = 80
		$Instructions2.modulate.a8 = 80

func new_game():
	if thugs.once == false:
		reset_timers()
		thugs.start_the_thug_timer.emit()
		Clock.start_clock()
		thugs.once = true
		Clock.default_hour()
		if thugs.night == 1:
			if instructed_door == false:
				$instructions.show()
				$Instructions.show()
				$instructions2.show()
				$Instructions2.show()
			elif Clock.instructed_arrow == false:
				Clock.show_instruction()
	$DulapDeschis.hide()
	thugs.on_left_door = false
	thugs.on_right_door = false
	thugs.on_dulap = false
	thugs.left_door_clicked = false
	thugs.right_door_clicked = false
	thugs.main = false
	thugs.check_mouse_pos()
	var arrow = $CanvasLayer/arrow
	var mousePos = get_global_mouse_position()
	add_child(cursor)
	thugs.brandon_flashed = false
	thugs.dreamy_flashed = false
	if ambience.ambience_started == false:
		ambience.start_ambience.emit()
		ambience.ambience_started = true

func reset_timers():
	thugs.dreamy_timer_started = false
	thugs.brandon_timer_started = false
	thugs.jason_timer_started = false

func _process(_delta):
	if thugs.on_right_door:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			thugs.right_door_clicked = true
			thugs.left_door_clicked = false
			instructed_door = true
			hide_instructions()
			trans.change_scene("res://floor_animation.tscn")
	if thugs.on_left_door:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			thugs.left_door_clicked = true
			thugs.right_door_clicked = false
			instructed_door = true
			hide_instructions()
			trans.change_scene("res://floor_animation.tscn")
	if thugs.inside == false:
		thugs.mouse_inside_at_first = false
	if thugs.on_dulap == true:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			trans.change_scene("res://floor_animation.tscn")
func _on_left_side_mouse_entered():
	var tween = create_tween()
	tween.tween_property($Camera2D,"position" ,Vector2(-630,0),1.3).from_current()

func _on_right_side_mouse_entered():
	var tween = create_tween()
	tween.tween_property($Camera2D,"position" ,Vector2(2070,0),1.3).from_current()

func _on_arrow_mouse_entered():
	Clock.instructed_arrow = true
	Clock.hide_instruction()
	thugs.inside = true
	if thugs.mouse_inside_at_first == false:
		trans.change_scene("res://bed_scene.tscn")
		thugs.check_mouse_pos()
func _on_arrow_mouse_exited():
	thugs.inside = false

func _on_usa_stanga_mouse_entered():
	$UsaInchisaStanga.hide()
	thugs.on_left_door = true

func _on_usa_stanga_mouse_exited():
	$UsaInchisaStanga.show()
	thugs.on_left_door = false

func _on_usa_drepta_mouse_entered():
	$UsaInchisaDreapta.hide()
	thugs.on_right_door = true

func _on_usa_drepta_mouse_exited():
	$UsaInchisaDreapta.show()
	thugs.on_right_door = false

func _on_dulap_area_mouse_entered():
	$DulapDeschis.show()
	thugs.on_dulap = true

func _on_dulap_area_mouse_exited():
	$DulapDeschis.hide()
	thugs.on_dulap = false

func hide_instructions():
	$instructions.hide()
	$Instructions.hide()
	$instructions2.hide()
	$Instructions2.hide()
