extends Node2D

var once = false
signal start_the_thug_timer
signal stop_the_thug_timer
var jumpscaring = false
var thug_timer_started = false
var door_mechanics_instructed = false

var brandon_pos = 0
var brandon_flashed = false
var brandon_timer_started = false

var dreamy_pos = 0
var dreamy_flashed = false
var dreamy_timer_started = false

var love_and_light_tv_scene = preload("res://love_and_light_tv.tscn")
var love_and_light_tvs = []
var flashed_love_and_light_tv = false
var flashing_love_and_light_tv = false
var love_and_light_tvs_number = 0
var love_and_light_tvs_number_added = 0
signal love_and_ligh_tv_spawned
var added = false
var remaining_love_and_light_tvs = 0

var inside = false
var night = 1
var mouse_inside_at_first = false
var on_left_door = false
var on_right_door = false
var left_door_clicked = false
var right_door_clicked = false
var main = false
var on_dulap = false
var at_door = false
signal jumpscare
var save_path = "user://stats.save"

var jason_pos = 0
var at_dulap = false
var jason_timer_started = false

signal dreamy_chance
signal brandon_chance
var dreamy_chance_not_emitted = true
var brandon_chance_not_emitted = true
var brandon_chance_nr
var dreamy_chance_nr

var flashing_left_hall = false
var flashed_left_hall = false
var flashing_right_hall = false
var flashed_right_hall = false

var on_right_hall = false
var on_left_hall = false


func save():
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(night)
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		night = file.get_var(night)



func _ready():
	new_game()
	load_data()

func new_game():
	jumpscaring = false
	brandon_pos = 0
	dreamy_pos = 0
	love_and_light_tvs_number = 0
	jason_pos = 0

func _on_thug_timer_night_1_timeout():
	var result = randf()
	if night == 1:
		if result < 0.45:
			if flashing_right_hall == false:
				if on_right_hall == false:
					brandon_pos += randi_range(1,2)
				elif brandon_pos < 15:
					brandon_pos += randi_range(1,2)
			else:
				brandon_pos += 0
		if result > 0.60:
			if flashing_left_hall == false:
				if on_left_hall == false:
					dreamy_pos += randi_range(1,2)
				elif dreamy_pos < 15:
					dreamy_pos += randi_range(1,2)
			else:
				dreamy_pos += 0
		if result > 0.92:
			if love_and_light_tvs_number < 5:
				love_and_light_tvs_number += 1
				remaining_love_and_light_tvs = 1
				love_and_ligh_tv_spawned.emit()
			elif jumpscaring == false:
				love_and_light_tv.love_and_light_tv_jumpscare.emit()
	if night == 2:
		if result < 0.50:
			if flashing_right_hall == false:
				if on_right_hall == false:
					brandon_pos += randi_range(1,2)
				elif brandon_pos < 15:
					brandon_pos += randi_range(1,2)
			else:
				brandon_pos += 0
		if result > 0.50:
			if flashing_left_hall == false:
				if on_left_hall == false:
					dreamy_pos += randi_range(1,2)
				elif dreamy_pos < 15:
					dreamy_pos += randi_range(1,2)
			else:
				dreamy_pos += 0
		if result > 0.87:
			if love_and_light_tvs_number < 5:
				love_and_light_tvs_number += 1
				remaining_love_and_light_tvs = 1
				love_and_ligh_tv_spawned.emit()
			elif jumpscaring == false:
				love_and_light_tv.love_and_light_tv_jumpscare.emit()
		if result < 25:
			jason_pos += 1
	if night == 3:
		if result < 0.55:
			if flashing_right_hall == false:
				if on_right_hall == false:
					brandon_pos += randi_range(1,2)
				elif brandon_pos < 15:
					brandon_pos += randi_range(1,2)
			else:
				brandon_pos += 0
		if result > 0.40:
			if flashing_left_hall == false:
				if on_left_hall == false:
					dreamy_pos += randi_range(1,2)
				elif dreamy_pos < 15:
					dreamy_pos += randi_range(1,2)
			else:
				dreamy_pos += 0
		if result > 0.84:
			if love_and_light_tvs_number < 5:
				love_and_light_tvs_number += 1
				remaining_love_and_light_tvs = 1
				love_and_ligh_tv_spawned.emit()
			elif jumpscaring == false:
				love_and_light_tv.love_and_light_tv_jumpscare.emit()
		if result < 30:
			jason_pos += 1
	if night == 4:
		if result < 0.65:
			if flashing_right_hall == false:
				if on_right_hall == false:
					brandon_pos += randi_range(1,2)
				elif brandon_pos < 15:
					brandon_pos += randi_range(1,2)
			else:
				brandon_pos += 0
		if result > 0.35:
			if flashing_left_hall == false:
				if on_left_hall == false:
					dreamy_pos += randi_range(1,2)
				elif dreamy_pos < 15:
					dreamy_pos += randi_range(1,2)
			else:
				dreamy_pos += 0
		if result < 0.20:
			if love_and_light_tvs_number < 5:
				love_and_light_tvs_number += 1
				remaining_love_and_light_tvs = 1
				love_and_ligh_tv_spawned.emit()
			elif jumpscaring == false:
				love_and_light_tv.love_and_light_tv_jumpscare.emit()
		if result < 35:
			jason_pos += 1
	if night == 5:
		if result < 0.70:
			if flashing_right_hall == false:
				if on_right_hall == false:
					brandon_pos += randi_range(1,2)
				elif brandon_pos < 15:
					brandon_pos += randi_range(1,2)
			else:
				brandon_pos += 0
		if result > 0.30:
			if flashing_left_hall == false:
				if on_left_hall == false:
					dreamy_pos += randi_range(1,2)
				elif dreamy_pos < 15:
					dreamy_pos += randi_range(1,2)
			else:
				dreamy_pos += 0
		if result > 0.70:
			if love_and_light_tvs_number < 5:
				love_and_light_tvs_number += 1
				remaining_love_and_light_tvs = 1
				love_and_ligh_tv_spawned.emit()
			elif jumpscaring == false:
				love_and_light_tv.love_and_light_tv_jumpscare.emit()
		if result < 50:
			jason_pos += 1
	if night == 6:
		pass

func _process(delta):
	#print("brandon" + str(brandon_pos))
	#print("dreamy" + str(dreamy_pos))
	#print(love_and_light_tvs_number_added)
	#print(thugs.mouse_inside_at_first)
	if brandon_pos == 15 or brandon_pos == 16:
		if brandon_chance_not_emitted == true:
			brandon_chance.emit()
			brandon_chance_not_emitted = false
	if dreamy_pos == 15 or dreamy_pos == 16:
		if dreamy_chance_not_emitted == true:
			dreamy_chance.emit()
			dreamy_chance_not_emitted = false
	if brandon_pos >= 20:
		if brandon_timer_started == false:
			$BrandonTimer.start()
			brandon_timer_started = true
	else :
		brandon_timer_started = false
	if dreamy_pos >= 20:
		if dreamy_timer_started == false:
			$DreamyTimer.start()
			dreamy_timer_started = true
	else:
		dreamy_timer_started = false
	if thugs.jason_pos >= 20:
		if jason_timer_started == false:
			$JasonTimer.start()
			jason_timer_started = true
	if brandon_pos <= 14:
		flashed_right_hall = false
		brandon_chance_not_emitted = true
	if dreamy_pos <= 14:
		flashed_left_hall = false
		dreamy_chance_not_emitted = true
	print("dreamy"+ str(dreamy_pos))
	print("brandon"+ str(brandon_pos))
	print("love"+ str(love_and_light_tvs_number))
	print("jason" + str(jason_pos))
	print("brandon"+ str(brandon_chance_nr))
	print("dreamy"+ str(dreamy_chance_nr))
func check_mouse_pos():
	if inside == true:
		mouse_inside_at_first = true
	elif inside == false:
		mouse_inside_at_first = false

func pause_brandon_timer():
	$BrandonTimer.paused = true

func unpause_brandon_timer():
	$BrandonTimer.paused = false

func pause_dreamy_timer():
	$DreamyTimer.paused = true

func unpause_dreamy_timer():
	$DreamyTimer.paused = false


func _on_brandon_timer_timeout():
	if jumpscaring == false:
		brandon.brandon_jumpscare.emit()
		$ThugTimer.stop()

func _on_dreamy_timer_timeout():
	if jumpscaring == false:
		dreamy.dreamy_jumpscare.emit()
		$ThugTimer.stop()

func _on_start_the_thug_timer():
	$ThugTimer.start()


func _on_stop_the_thug_timer():
	$ThugTimer.stop()


func _on_jason_timer_timeout():
	jason.jason_jumpscare.emit()


func _on_dreamy_chance():
	var result = randf()
	if result >0.5:
		dreamy_chance_nr = 1
	elif result <0.5:
		dreamy_chance_nr = 0


func _on_brandon_chance():
	var result = randf()
	if result >0.5:
		brandon_chance_nr = 1
	elif result <0.5:
		brandon_chance_nr = 0
