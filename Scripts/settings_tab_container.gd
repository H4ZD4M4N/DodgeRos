extends Control

func _on_h_slider_value_changed(value):
	var music_player = get_node("/root/Main/MusicPlayer")
	music_player.volume_db = linear_to_db(value)



func _on_slider_fx_value_changed(value):
	var music_player = get_node("/root/Main/GameOverSound")
	if value == 0:
		music_player.volume_db = linear_to_db(value)
	else:
		music_player.volume_db = linear_to_db(value) + 5
	

func _on_slider_ros_value_changed(value):
	var music_player = get_node("/root/Main/DeathSound")
	if value == 0:
		music_player.volume_db = linear_to_db(value)
	else:
		music_player.volume_db = linear_to_db(value) + 15


func _on_check_seasonal_toggled(button_pressed):
	var playerHat = get_node("/root/Main/Player/Sprite_ChristmasHat")
	playerHat.visible = button_pressed
	
	var music_player = get_node("/root/Main/MusicPlayer")
	
	var song	
	if button_pressed:
		song = load("res://Sounds/Christmas Rap.mp3")
	else:
		song = load("res://Sounds/2021-08-16_-_8_Bit_Adventure_-_www.FesliyanStudios.com.mp3")

	music_player.stream = song
	
	var main_node = get_node("/root/Main/")
	
	if main_node.game_in_progress:
		music_player.play()
