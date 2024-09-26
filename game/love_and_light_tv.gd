extends CharacterBody2D

func _process(delta):
	if thugs.flashing_love_and_light_tv == true:
		position.x += randf_range(-1,1)
		position.y += randf_range(-1,1)
