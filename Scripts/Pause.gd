extends Node2D

var pausable = false

var options_menu

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	options_menu = get_node("/root/Main/HUD/OptionsMenu")

func _process(_delta):
	if Input.is_action_just_pressed("space") and !options_menu.visible:
		toggle_pause()

func toggle_pause():
	if pausable:
		get_tree().paused = !get_tree().paused
