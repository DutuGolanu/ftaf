extends CanvasLayer

var time = 0
var fading = false
var instructed_arrow = false
var instructed_hol = false

func _ready():
	$MarginContainer2.hide()
	$NinePatchRect.hide()
	$Label2.hide()
	hide()
	$Label.modulate.a8 = 100
	$Night.modulate.a8 = 0
	set_process(false)
	default_hour()
	$MarginContainer.hide()
	if instructed_arrow == false:
		$MarginContainer.modulate.a8 = 80
	if instructed_hol == false:
		$MarginContainer2.modulate.a8 = 80
		$NinePatchRect.modulate.a8 = 80
		$Label2.modulate.a8 = 80

func start_clock():
	if thugs.once == false:
		thugs.once = true
		default_hour()
		$Timer.start()
		set_process(true)
		await get_tree().create_timer(3).timeout
		fading = true
		await get_tree().create_timer(1).timeout

func end_clock():
	default_hour()
	$Timer.end()

func _on_timer_timeout():
	time += 1
	$Label.text = str(time) + " AM"
	if time == 6:
		trans.change_scene("res://survived.tscn")

func default_hour():
	$Label.text = str(12) + " AM"

func _process(delta):
	$Night.text = "Night " + str(thugs.night)
	if fading == false:
		if $Night.modulate.a8 <= 200:
			$Night.modulate.a8 += 2
	if fading == true:
		$Night.modulate.a8 -= 2

func show_instruction():
	$MarginContainer.show()
func hide_instruction():
	$MarginContainer.hide()

func show_hol_instruction():
	$MarginContainer2.show()
	$NinePatchRect.show()
	$Label2.show()

func hide_hol_instruction():
	$MarginContainer2.hide()
	$NinePatchRect.hide()
	$Label2.hide()
