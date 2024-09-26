extends Node2D


func _ready():
	thugs.mouse_inside_at_first = false
	setup_movement_x()
	setup_movement_y()
	$Steps.play()
	await get_tree().create_timer(1).timeout
	if thugs.left_door_clicked and thugs.main == false:
		trans.change_scene("res://hol_stanga.tscn")
	elif thugs.right_door_clicked and thugs.main == false:
		trans.change_scene("res://hol_dreapta.tscn")
	elif thugs.main == true:
		trans.change_scene("res://main.tscn")
	elif thugs.on_dulap == true:
		trans.change_scene("res://dulap.tscn")
func setup_movement_x():
	var tween = create_tween().set_loops().set_trans(Tween.TRANS_CIRC)
	var initial_position = $Camera2D.position.x
	tween.tween_property($Camera2D, "position:x", 1000, 0.2,)
	tween.tween_property($Camera2D, "position:x", initial_position, 0.2,)

func setup_movement_y():
	await get_tree().create_timer(0.1).timeout
	var tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR)
	var initial_position = $Camera2D.position.y
	tween.tween_property($Camera2D, "position:y", 600, 0.2,)
	tween.tween_property($Camera2D, "position:y", initial_position, 0.2,)
