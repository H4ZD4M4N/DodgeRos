extends Node

@export var enemies: Array[PackedScene]

func start_spawning():
	$SpawnTimer.start(2)
	$LevelUpTimer.start()
	
func stop_spawning():
	$SpawnTimer.stop()
	$LevelUpTimer.stop()
	
#Add in new timer which counts down to when SpawnTimer should increase in speed

func _on_spawn_timer_timeout():
	var enemy = enemies[randi() % enemies.size()].instantiate()
	
	var enemy_spawn_location = get_node("SpawnPath/SpawnPathFollower")
	enemy_spawn_location.progress_ratio = randf()
	
	enemy.position = enemy_spawn_location.position
	
	var direction = enemy_spawn_location.rotation
	direction += randf_range(PI/6, (5*PI)/6)
	enemy.rotation = direction
	
	var velocity = Vector2(randf_range(200, 400), 0)
	enemy.linear_velocity = velocity.rotated(direction)
	
	add_child(enemy)


func _on_level_up_timer_timeout():
	$SpawnTimer.wait_time = $SpawnTimer.wait_time/2
