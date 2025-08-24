extends CharacterBody2D


const SPEED = 150.0
const DASH_SPEED = -200.0
const JUMP_VELOCITY = -300.0
var attack = 0
var state = "move"
var dash_used = false
var health = 100
var lastAttackTime = Time.get_ticks_msec()
var lastDirection = 0.0
var dead = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

func _process(delta: float) -> void:
		
	var direction := Input.get_axis("move_left", "move_right")
	if not direction == 0.0:
		lastDirection = direction
	
	if not is_on_floor():
		# Add the gravity.
		velocity += get_gravity() * delta
		# Double jump
		if Input.is_action_just_pressed("jump") and !dash_used:
			dash_used = true
			velocity.y = DASH_SPEED

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if dead == true: 
		return
	
	if state != "move":
		return
		
	if is_on_floor():
		dash_used = false
		if Input.is_action_just_pressed("attack"):
			animated_sprite.play("punch")
			state = "attack"
			var attack = calculateAttackStrength()
			if lastDirection > 0 and ray_cast_right.is_colliding(): 
				dealDamage(ray_cast_right, attack)
			if lastDirection < 0 and ray_cast_left.is_colliding():
				dealDamage(ray_cast_left, attack)
		elif direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

func dealDamage(rayCast: RayCast2D, attack: float) -> void:
	var object = rayCast.get_collider()
	if (object.name == "Killzone"):
		object.owner.dealDamage(attack)
		
func calculateAttackStrength() -> float:
	var differenceTime = float(Time.get_ticks_msec() - lastAttackTime);
	var attack = 50.0
	if differenceTime < 2000.0:
		attack = 50.0 * (differenceTime / 2000.0) * 0.5
	lastAttackTime = Time.get_ticks_msec()
	return attack
	
func die():
	dead = true
	animated_sprite.play("die")

func _on_animated_sprite_2d_animation_finished() -> void:
	state = "move"
