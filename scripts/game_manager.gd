extends Node

@export var player: Player

@onready var scoreTextLabel: Label  = $ScoreTextLabel

func _process(delta: float) -> void:
	scoreTextLabel.text = "Score: " + str(player.score)
