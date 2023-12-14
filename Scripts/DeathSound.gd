extends AudioStreamPlayer2D

@export var death_sounds: Array

func play_death_sound():
	var sound = death_sounds[randi() % death_sounds.size()]
	stream = sound
	play()
