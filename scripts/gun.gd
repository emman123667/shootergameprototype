# Gun node script
class_name Gun

extends Node2D

var bulletScene: PackedScene = preload("res://scenes/bullet.tscn")
var canShoot: bool = true

@export var gunOwner: Character
@onready var cooldownTimer: Timer = $CooldownTimer

signal gunFire
signal gunReload


func _ready() -> void:
	gunFire.connect(_on_gun_fire)
	cooldownTimer.timeout.connect(_onCooldownTimeout)


func _on_gun_fire() -> void:
	if canShoot:
		# Spawns a bullet depending on the gun's current position and where the mouse is pointing
		var bullet: Bullet = bulletScene.instantiate()
		var referencePosition: Vector2 = get_global_mouse_position() # Gets the mouse's current position from the scene's coordinate system

		# If the owner of the gun is an AI enemy, then set the reference position to the target player's current position
		if gunOwner is Enemy:
			bullet.alignment = bullet.Alignment.ENEMY
			referencePosition = gunOwner.targetPlayer.position
		elif gunOwner is Player:
			bullet.alignment = bullet.Alignment.PLAYER
	
		bullet.firedFromPosition = self.global_position
		bullet.shootingAngle = (referencePosition - self.global_position).angle() # Angle from the gun to the position of the mouse
		bullet.global_position = self.global_position

		bullet.damage = gunOwner.damage # Set the bullet's damage to the character's attack damage

		get_tree().current_scene.add_child(bullet)

		canShoot = false
		cooldownTimer.start()


func _onCooldownTimeout() -> void:
	cooldownTimer.stop()
	canShoot = true
	
