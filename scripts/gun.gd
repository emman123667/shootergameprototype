class_name Gun

extends Node2D

var bulletScene: PackedScene = preload("res://scenes/bullet.tscn")
var canShoot: bool = true

signal gunFire
signal gunReload

func _process(delta: float) -> void:
	print(position)
	print(global_position)
	# print(get_viewport().get_mouse_position())
	# print(get_global_mouse_position()) 


func _ready() -> void:
	gunFire.connect(_on_gun_fire)


func _on_gun_fire() -> void:
	if canShoot:
		# Spawns a bullet depending on the gun's current position and where the mouse is pointing
		var bullet: Bullet = bulletScene.instantiate()
		var mousePosition = get_global_mouse_position() # Gets the mouse's current position from the scene's coordinate system
		bullet.shootingAngle = (mousePosition - self.global_position).angle() # Angle from the gun to the position of the mouse
		bullet.global_position = self.global_position
		get_tree().current_scene.add_child(bullet)
