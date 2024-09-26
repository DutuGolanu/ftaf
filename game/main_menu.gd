extends Control

var once = false

func _ready():
	$warning.modulate.a8 = 0
	$AudioStreamPlayer2D.play()
	ambience.ambience_started = false
	thugs.love_and_light_tvs_number = 0
	thugs.brandon_pos = 0
	thugs.dreamy_pos = 0
	thugs.jason_pos = 0
	thugs.stop_the_thug_timer.emit()
	ambience.stop_ambience.emit()
	Clock.hide()
	thugs.once = false
	$NightLabel.text = str(thugs.night)
func _process(delta):
	if once == false:
		if $warning.modulate.a8 <=250:
			$warning.modulate.a8 += 1
			if $warning.modulate.a8 >= 250:
				once = true
	if once == true:
		await get_tree().create_timer(1).timeout
		if $warning.modulate.a8 >0:
			$warning.modulate.a8 -=1
		if $ColorRect.modulate.a8 >0:
			$ColorRect.modulate.a8 -=1
		if $ColorRect.modulate.a8 == 0:
			$ColorRect.hide()
			
func _on_new_game_pressed():
	thugs.night = 1
	trans.change_scene("res://main.tscn")



func _on_continue_pressed():
	trans.change_scene("res://main.tscn")
