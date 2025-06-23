extends Button

func _ready():
	button_down.connect(_onPlayBtnClicked)

func _onPlayBtnClicked() -> void:
	var newGameScene: PackedScene = load("res://scenes/game.tscn")
	var newGame: Node2D = newGameScene.instantiate()
	self.get_tree().get_root().add_child(newGame)
	self.get_tree().current_scene.queue_free()
	self.get_tree().current_scene = newGame