class_name Bullet
extends CharacterBody2D

enum Alignment {PLAYER, ENEMY}

var shootingAngle: float
var alignment: Alignment
var firedFromPosition: Vector2

@export var damage: int = 10 # BULLET'S DEFAULT DAMAGE
@export var speed: float = 500.0

func _physics_process(delta: float) -> void:
	# TODO ADD CODE TO LIMIT THE DISTANCE THE BULLET CAN TRAVEL AWAY FROM THE GUN NODE
	if (self.global_position - firedFromPosition).length() <= 300.0:
		self.velocity = Vector2(1, 0).rotated(shootingAngle) * speed
	else:
		self.queue_free()
	self.move_and_slide()
