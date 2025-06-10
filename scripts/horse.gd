extends CharacterBody2D

var SPEED = 0

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	animated_sprite.flip_h = true
	
func run() -> void:
	if timer.is_stopped():
		print("Run!!")
		timer.start(5)
		SPEED = 2000
	
func _on_timer_timeout() -> void:
	SPEED = 0
	print("Run stopped")
	timer.stop()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if timer.is_stopped():
		SPEED = 0
		
	if ray_cast_right.is_colliding():
		if timer.is_stopped() and ray_cast_right.get_collider().get_class() == 'CharacterBody2D':
			if getDistance(ray_cast_right) < 15:
				run()
				direction = -1
				animated_sprite.flip_h = false
			else:
				SPEED = 500
				direction = 1
				animated_sprite.flip_h = true
				
		else:
			direction = -1
			animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		if timer.is_stopped() and ray_cast_left.get_collider().get_class() == 'CharacterBody2D':
			if getDistance(ray_cast_left) < 15:
				run()
				direction = 1
				animated_sprite.flip_h = true
			else:
				SPEED = 500
				direction = -1
				animated_sprite.flip_h = false
		else:
			direction = 1
			animated_sprite.flip_h = true
				
	velocity.x = direction * SPEED * delta
	move_and_slide()
	
func getDistance(raycast: RayCast2D) -> float:
	var origin = raycast.global_transform.origin
	var collision_point = raycast.get_collision_point()
	return origin.distance_to(collision_point)
