extends Camera2D

var shake_amount : float

func _process(delta):
	offset = Vector2(randf_range(-1,1) * shake_amount, randf_range(-1,1) * shake_amount)

func shake_camera(time,shake):
	shake_amount = shake
	set_process(true)
	$Timer.start(time)


func _on_timer_timeout():
	set_process(false)
