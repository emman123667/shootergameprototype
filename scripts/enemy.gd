class_name Enemy

extends Character

@export var targetPlayer: Player

@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	hitbox.isHit.connect(_onHitboxIsHit)

func _physics_process(delta: float) -> void:
	# Follow the player
	self.velocity = (targetPlayer.position - self.position).normalized() * move_speed
	self.move_and_slide()

func takeDamage(dmgSource: Bullet):
	health = health - dmgSource.damage
	if health <= 0:
		self.queue_free() # Removes the enemy from the scene tree

func _onHitboxIsHit(dmgSource: Bullet):
	if dmgSource.alignment == dmgSource.Alignment.PLAYER:
		takeDamage(dmgSource)
		dmgSource.queue_free()
