extends Node2D

var pausable = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed("space"):
		toggle_pause()

func toggle_pause():
	if pausable:
		get_tree().paused = !get_tree().paused
