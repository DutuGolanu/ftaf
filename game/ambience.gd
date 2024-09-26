extends AudioStreamPlayer2D

signal breathing
signal start_ambience
signal stop_ambience
var ambience_started = false

func _on_breathing():
	$breathing_sound.play()

func stop_breathing_sounds():
	$breathing_sound.stop()


func _on_start_ambience():
	play()


func _on_stop_ambience():
	stop()
