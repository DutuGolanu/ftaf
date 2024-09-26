extends CanvasLayer

signal dreamy_jumpscare

func _ready():
	hide()

func _process(delta):
	$dreamy.offset.x = randf_range(-3,3)
	$dreamy.offset.y = randf_range(-3,3)

func _on_dreamy_jumpscare():
	get_tree().paused = true
	thugs.jumpscaring = true
	$JumpScareSound.play()
	show()
	$Timer.start()
	ambience.stop_breathing_sounds()


func _on_jump_scare_sound_finished():
	hide()

func _on_timer_timeout():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
