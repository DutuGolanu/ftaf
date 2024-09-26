extends Node2D

var flashing_love_and_light_tv = false
var timer_timing = false

var love_and_light_tv_scene = preload("res://love_and_light_tv.tscn")
var love_and_light_tvs = []

func _ready():
	$PointLight2D.hide()
	iterate_love_and_lights()
	thugs.remaining_love_and_light_tvs = 0
func iterate_love_and_lights():
	for i in thugs.love_and_light_tvs_number:
		add_love_and_light_tvs()

func iterate_remaining_love_and_lights():
	for i in thugs.remaining_love_and_light_tvs:
		add_love_and_light_tvs()

func _process(delta):
	thugs.love_and_ligh_tv_spawned.connect(iterate_remaining_love_and_lights)
	if Input.is_action_pressed("flashlight"):
		$PointLight2D.show()
		thugs.flashing_love_and_light_tv = true
		if timer_timing == false:
			if thugs.love_and_light_tvs_number > 0:
				$FlashingTimer.start()
				timer_timing = true
		
	else:
		timer_timing = false
		thugs.flashing_love_and_light_tv = false
		$PointLight2D.hide()
		$FlashingTimer.stop()
	if thugs.inside == false:
		thugs.mouse_inside_at_first = false
func _on_arrow_mouse_entered():
	thugs.inside = true
	if thugs.mouse_inside_at_first == false:
		trans.change_scene("res://main.tscn")

func _on_arrow_mouse_exited():
	thugs.inside = false

func _on_flashing_timer_timeout():
	get_tree().call_group("love_and_light_tvs","queue_free")
	thugs.love_and_light_tvs_number = 0
	
func add_love_and_light_tvs():
	var love_and_light_tv = love_and_light_tv_scene.instantiate()
	love_and_light_tv.position = Vector2(randi_range(570,1215),randi_range(550,660))
	add_child(love_and_light_tv)
	love_and_light_tvs.append(love_and_light_tv)
	love_and_light_tv.add_to_group("love_and_light_tvs")
