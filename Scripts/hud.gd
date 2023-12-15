extends CanvasLayer

signal start_game

var pauser

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	pauser = get_node("/root/Main/Pause")

func _on_start_button_pressed():
	$StartButton.hide()
	update_message("GET READY!")
	$MessageTimer.start()
	start_game.emit()

func game_over():
	update_message("GAME OVER!")
	await $MessageTimer.timeout
	
	$ChangableText.text = "DodgeRos"
	$ChangableText.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_message(message):
	$ChangableText.text = message
	$ChangableText.show()
	$MessageTimer.start()

func update_score(score):
	$ScoreText.text = str(score)

func _on_message_timer_timeout():
	$ChangableText.hide()

func _on_settings_button_pressed():
	$OptionsMenu.show()
	$OptionsMenu.set_process(true)
	if !get_tree().paused:
		pauser.toggle_pause()

func _on_options_menu_options_exit():
	$OptionsMenu.hide()
	if get_tree().paused:
		pauser.toggle_pause()
