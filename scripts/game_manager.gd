extends Node

@export var player: Player

@onready var scoreTextLabel: Label  = $ScoreTextLabel

var gameOverScene: PackedScene = preload("res://scenes/game_over_screen.tscn")

func _process(delta: float) -> void:
	scoreTextLabel.text = "Score: " + str(player.score)
	if player.health <= 0:
		var loseScreen: GameOverScreen = gameOverScene.instantiate()
		loseScreen.score = player.score
		self.get_tree().get_root().add_child(loseScreen)
		self.get_tree().current_scene.queue_free()
		self.get_tree().current_scene = loseScreen
