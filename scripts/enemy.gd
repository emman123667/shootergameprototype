class_name Enemy

extends Character

enum CurrentState {FOLLOW_PLAYER, STALL}

@export var targetPlayer: Player
@export var scoreIncrease: int

var currentState: CurrentState

@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	hitbox.isHit.connect(_onHitboxIsHit)
	currentState = CurrentState.FOLLOW_PLAYER

func _physics_process(delta: float) -> void:
	# Follow the player
	if currentState == CurrentState.FOLLOW_PLAYER:
		self.velocity = (targetPlayer.position - self.position).normalized() * move_speed
	elif currentState == CurrentState.STALL:
		self.velocity = Vector2.ZERO
	self.move_and_slide()

func takeDamage(dmgSource: Bullet):
	health = health - dmgSource.damage
	if health <= 0:
		targetPlayer.score += scoreIncrease
		self.queue_free() # Removes the enemy from the scene tree

func _onHitboxIsHit(dmgSource: Bullet):
	if dmgSource.alignment == dmgSource.Alignment.PLAYER:
		takeDamage(dmgSource)
		dmgSource.queue_free()

func setCurrentState(newState: CurrentState):
	currentState = newState