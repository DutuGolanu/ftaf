extends CanvasLayer

signal love_and_light_tv_jumpscare

func _ready():
	hide()

func _process(delta):
	$love_and_light_tv.offset.x = randf_range(-3,3)
	$love_and_light_tv.offset.y = randf_range(-3,3)

func _on_jump_scare_sound_finished():
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_love_and_light_tv_jumpscare():
	get_tree().paused = true
	thugs.jumpscaring = true
	$JumpScareSound.play()
	show()
	$Timer.start()
	ambience.stop_breathing_sounds()
