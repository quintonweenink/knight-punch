extends Area2D

@onready var label: Label = $Label
@onready var tombstone: Area2D = $"."

func _on_body_entered(_body: Node2D) -> void:
	label.text = tombstone.get_meta("text")
	label.visible = true


func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	label.visible = false
	
