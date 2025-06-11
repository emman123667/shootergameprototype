class_name Player

extends CharacterBody2D

signal testSignal
signal playerFire

@onready var currentGun: Gun = $Gun

const SPEED = 200.0

func _ready() -> void:
	playerFire.connect(_on_player_fire)

func _physics_process(delta: float) -> void:
	var x_direction := Input.get_axis("player_move_left", "player_move_right")
	var y_direction := Input.get_axis("player_move_up", "player_move_down")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = 0

	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = 0

	move_and_slide()

func _input(event) -> void:
	if event.is_action_pressed("emit_test_signal"):
		testSignal.emit()

	if event.is_action_pressed("gun_shoot"):
		playerFire.emit()

func _on_player_fire() -> void:
	currentGun.gunFire.emit()
	
	
