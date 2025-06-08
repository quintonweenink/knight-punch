extends AnimatableBody2D

var SPEED = 20
var direction = 1
var count = 0

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	count += 1
	if count > 10: 
		direction *= -1
	position.x += direction * SPEED * delta
