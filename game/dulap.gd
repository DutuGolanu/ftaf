extends Node2D

var can_flashlight = true
var flashing = false
var door_held_timer_started = false
var jumpscare_timer_started = false

func _ready():
	$LuminaMare.hide()
	$LuminaMica.hide()
	$dulap_inchis.hide()
	
func _process(delta):
	if Input.is_action_pressed("flashlight") and can_flashlight:
		$ColorRect.hide()
		flashing = true
		$LuminaMare.show()
		$LuminaMica.show()
		if thugs.jason_pos >= 15:
			if thugs.night >= 2:
				$jason.show()
	else:
		$ColorRect.show()
		$jason.hide()
		flashing = false
		$LuminaMare.hide()
		$LuminaMica.hide()
	if Input.is_action_pressed("close_door"):
		$ColorRect.hide()
		$dulap_inchis.show()
		can_flashlight = false
		if thugs.jason_pos >= 15:
			jumpscare_timer_started = false
			$JasonTimer.stop()
			if door_held_timer_started == false:
				$DoorHeldTimer.start()
				door_held_timer_started = true
	else:
		$dulap_inchis.hide()
		can_flashlight = true
		if thugs.jason_pos >= 15:
			door_held_timer_started = false
			$DoorHeldTimer.stop()
			if jumpscare_timer_started == false:
				$JasonTimer.start()
				jumpscare_timer_started = true

func _on_go_back_mouse_entered():
	thugs.main = true
	trans.change_scene("res://floor_animation.tscn")

func _on_jason_timer_timeout():
	jason.jason_jumpscare.emit()


func _on_door_held_timer_timeout():
	thugs.jason_pos = 2
