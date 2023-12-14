extends Node2D

var score: int

func _on_hud_start_game():
	score = 0
	$HUD.update_score(score)
	$Player.start()
	$EnemySpawner.start_spawning()
	await get_tree().create_timer(2).timeout
	$ScoreTimer.start()
	$MusicPlayer.play()

func _on_player_hit():
	$ScoreTimer.stop()
	$MusicPlayer.stop()
	$DeathSound.play_death_sound()
	$HUD.game_over()
	$EnemySpawner.stop_spawning()
	get_tree().call_group("enemy", "queue_free")

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)
