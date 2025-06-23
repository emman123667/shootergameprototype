class_name GameOverScreen

extends Node2D

var score: int = 0

@onready var scoreLabel: Label = $ScoreLabel

func _process(delta: float) -> void:
	scoreLabel.text = "Score: " + str(score)

func _onMainMenuBtnClicked() -> void:
	var mainMenuScene: PackedScene = load("res://scenes/main_menu_screen.tscn")
	var mainMenu: Node2D = mainMenuScene.instantiate()
	self.get_tree().get_root().add_child(mainMenu)
	self.get_tree().current_scene.queue_free()
	self.get_tree().current_scene = mainMenu
