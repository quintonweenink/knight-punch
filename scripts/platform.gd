extends AnimatableBody2D

var SPEED = 1
var direction = 1
var count = 0

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	count += 1
		
	if count > 100: 
		count = 0
		direction *= -1
		
	position.x += direction * SPEED
