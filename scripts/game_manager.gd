extends Node2D

@onready var player: Player = $Player

func _ready() -> void:
    player.testSignal.connect(_on_player_test_signal)

func _on_player_test_signal() -> void:
    print("Hello world!! This signal was emitted from the player!")