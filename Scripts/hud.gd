extends CanvasLayer

signal start_game

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
