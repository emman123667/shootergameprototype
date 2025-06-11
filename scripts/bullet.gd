class_name Bullet
extends CharacterBody2D

var shootingAngle: float

@export var damage: int = 10
@export var speed: float = 500.0

func _physics_process(delta: float) -> void:
	self.velocity = Vector2(1, 0).rotated(shootingAngle) * speed
	move_and_slide()
