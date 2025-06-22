class_name EnemyShootTimer

extends Timer

@export var gun: Gun

func _ready() -> void:
	timeout.connect(_onWeaponFire)

func _onWeaponFire() -> void:
	gun.gunFire.emit()
