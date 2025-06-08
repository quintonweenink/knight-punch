extends Node2D

var SPEED = 15

var direction = 1
var health = 100

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $Killzone

func dealDamage(damage: float) -> void:
	print("Damage dealt: " + str(damage))
	health -= damage
	if health <= 0:
		animated_sprite.play("slime_death")
		SPEED = 0
		killzone.queue_free()

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
	
