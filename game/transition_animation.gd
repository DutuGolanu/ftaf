extends CanvasLayer

func change_scene(target):
	$AnimationPlayer.play("transition_animation")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
