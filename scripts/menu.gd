extends Control		

func _on_time_management_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/time_game.tscn")

func _on_paardencoaching_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/horse_game.tscn")

func _on_boksen_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_bonus_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_nationality.tscn")
