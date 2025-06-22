class_name Hitbox

extends Area2D

@export var hitboxOwner: Character

signal isHit

func _ready() -> void:
	body_entered.connect(_onBodyEnteredHitbox)

func _onBodyEnteredHitbox(body: Node2D):
	if body is Bullet:
		isHit.emit(body)
