extends StaticBody2D

@onready var ray_cast: RayCast2D = $RayCast2D

func _physics_process(delta: float) -> void:
	if ray_cast.is_colliding() and ray_cast.get_collider().get('name') == 'Horse':
		print("You did it!")
		ray_cast.get_collider().queue_free()
		queue_free()
