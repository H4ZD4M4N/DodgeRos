extends Area2D

signal hit

@export var speed: float = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	# At the beginning of each frame, default the player to not moving
	var velocity = Vector2.ZERO
	
	# Check for any movement input
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	# Set the position of the node
	position += velocity * speed * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	# Flip the sprite depending on what direction we're moving in
	if velocity.x < 0:
		scale.x = -1
	elif velocity.x > 0:
		scale.x = 1
	
	if velocity.y < 0:
		scale.y = -1
	elif velocity.y > 0:
		scale.y = 1


func _on_body_entered(_body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start():
	position = $StartPosition.position
	show()
	$CollisionShape2D.disabled = false
