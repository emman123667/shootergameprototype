class_name Player

extends Character

signal testSignal
signal playerFire

var score: int

@onready var currentGun: Gun = $Gun
@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	playerFire.connect(_on_player_fire)
	hitbox.isHit.connect(_onHitboxIsHit)

func _physics_process(delta: float) -> void:
	var x_direction := Input.get_axis("player_move_left", "player_move_right")
	var y_direction := Input.get_axis("player_move_up", "player_move_down")
	if x_direction:
		velocity.x = x_direction * move_speed
	else:
		velocity.x = 0

	if y_direction:
		velocity.y = y_direction * move_speed
	else:
		velocity.y = 0

	move_and_slide()

func _input(event) -> void:
	if event.is_action_pressed("gun_shoot"):
		playerFire.emit()

func _on_player_fire() -> void:
	currentGun.gunFire.emit()

func takeDamage(dmgSource: Bullet):
	health = health - dmgSource.damage
	print("Player takes " + str(dmgSource.damage) + " damage. Player has " + str(health) + " left.")
	if health <= 0:
		print("Player dies.")

func _onHitboxIsHit(dmgSource: Bullet):
	if dmgSource.alignment == dmgSource.Alignment.ENEMY:
		takeDamage(dmgSource)
		dmgSource.queue_free()