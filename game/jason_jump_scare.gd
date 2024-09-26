extends CanvasLayer

signal jason_jumpscare

func _ready():
	hide()

func _process(delta):
	$jason.offset.x = randf_range(-3,3)
	$jason.offset.y = randf_range(-3,3)
func _on_jason_jumpscare():
	get_tree().paused = true
	thugs.jumpscaring = true
	$JumpScareSound.play()
	show()
	ambience.stop_breathing_sounds()


func _on_jump_scare_sound_finished():
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
