class_name PlayerCloseRadius

extends Area2D

@export var player: Enemy

func _ready() -> void:
	body_entered.connect(_onCloseRadiusReached)
	body_exited.connect(_onCloseRadiusExited)

func _onCloseRadiusReached(body: Node2D) -> void:
	if body is Enemy:
		body.setCurrentState(body.CurrentState.STALL)

func _onCloseRadiusExited(body: Node2D) -> void:
	if body is Enemy:
		body.setCurrentState(body.CurrentState.FOLLOW_PLAYER)
