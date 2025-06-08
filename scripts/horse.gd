extends Area2D

var SPEED = 5

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	animated_sprite.flip_h = true
	
func _on_body_entered(body: Node2D) -> void:
	print("Run!!")
	if timer.is_stopped():
		print("Run!!")
		timer.start(5)
		SPEED = 100
	
func _on_timer_timeout() -> void:
	SPEED = 5
	timer.stop()

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		if timer.is_stopped() and ray_cast_right.get_collider().get_class() == 'CharacterBody2D':
			direction = 1
			animated_sprite.flip_h = true
		else:
			direction = -1
			animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		if timer.is_stopped() and ray_cast_left.get_collider().get_class() == 'CharacterBody2D':
			direction = -1
			animated_sprite.flip_h = false
		else:
			direction = 1
			animated_sprite.flip_h = true
	position.x += direction * SPEED * delta
	
