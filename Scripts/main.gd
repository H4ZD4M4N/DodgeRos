extends Node2D

var game_in_progress = false
var score: int

func _on_hud_start_game():
	game_in_progress = true
	score = 0
	$HUD.update_score(score)
	$Player.start()
	$EnemySpawner.start_spawning()
	await get_tree().create_timer(2).timeout
	$ScoreTimer.start()
	$MusicPlayer.play()
	$Pause.pausable = true

func _on_player_hit():
	game_in_progress = false
	$ScoreTimer.stop()
	$MusicPlayer.stop()
	$DeathSound.play_death_sound()
	$HUD.game_over()
	$EnemySpawner.stop_spawning()
	get_tree().call_group("enemy", "queue_free")
	$Pause.pausable = false

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)
