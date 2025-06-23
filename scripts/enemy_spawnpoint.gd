class_name EnemySpawnpoint

extends Marker2D

@export var targetPlayer: Player
var enemyScene: PackedScene = preload("res://scenes/enemy.tscn")
var superEnemyScene: PackedScene = preload("res://scenes/super_enemy.tscn")

@onready var spawnTimer: Timer = $SpawnTimer

func _ready() -> void:
	spawnTimer.timeout.connect(_onSpawnTimerTimeout)
	spawnTimer.wait_time = randf_range(1.0, 10.0)
	spawnTimer.start()

func _onSpawnTimerTimeout():
	for i in range(randi_range(1, 3)):
		var enemy: Enemy
		# 2.5% chance that the enemy spawnpoint would spawn a super enemy
		var randNum = randf()
		if randNum <= 0.025:
			enemy = superEnemyScene.instantiate()
		else:
			enemy = enemyScene.instantiate()

		enemy.targetPlayer = self.targetPlayer
		enemy.global_position = self.global_position + Vector2(randf_range(-200.0, 200.0), 0)
		self.get_tree().current_scene.add_child(enemy)
	spawnTimer.wait_time = randf_range(4.0, 5.0)
