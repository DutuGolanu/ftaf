extends CanvasLayer

func _ready():
	$ColorRect.hide()


func change_scene(target):
	$AnimationPlayer.play("transition")
	$ColorRect.show()
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play("reveal")
	await $AnimationPlayer.animation_finished
	$ColorRect.hide()
