extends Control


func _on_button_level1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_time_management_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/time_management_game.tscn")
