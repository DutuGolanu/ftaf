extends CanvasLayer


func change_scene(scene):
	$AnimationPlayer.play("transitie")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(scene)
