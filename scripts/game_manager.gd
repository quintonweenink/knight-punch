extends Node

var score = 0

@onready var score_label: Label = $"../CanvasLayer/MarginContainer/ScoreLabel"
@onready var coin_sound: AudioStreamPlayer2D = $CoinSound

func add_point():
	score += 1
	coin_sound.play()
	print("Score: " + str(score))
	score_label.text = "Score: " + str(score)
