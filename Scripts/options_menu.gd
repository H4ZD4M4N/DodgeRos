extends Control

signal options_exit

var main_node
var color_rect

func _ready():
	main_node = get_node("/root/Main/")
	color_rect = get_node("MarginContainer/ColorRect")

func _process(_delta):
	if main_node.game_in_progress:
		color_rect.color = Color(0.24, 0.24, 0.24, 0.4)
	else:
		color_rect.color = Color(0.24, 0.24, 0.24, 1)

func _on_exit_button_pressed():
	set_process(false)
	options_exit.emit()
