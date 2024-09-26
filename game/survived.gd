extends Control

func _ready():
	ambience.stop()
	Clock.time = 0
	if thugs.night !=6:
		thugs.night += 1
	$AudioStreamPlayer.play()
	thugs.once = false
	Clock.hide()
	thugs.save()
	$SavedByTheBell.play()

func _on_timer_timeout():
	$Timer2.start()
	for i in 10:
		await get_tree().create_timer(0.5).timeout
		$Label.show()
		await get_tree().create_timer(0.5).timeout
		$Label.hide()

func _on_timer_2_timeout():
	trans.change_scene("res://main_menu.tscn")
