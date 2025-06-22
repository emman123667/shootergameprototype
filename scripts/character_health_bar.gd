class_name CharacterHealthBar

extends Node2D

@export var character: Character
var maxHealth: int

@onready var colouredBar: ColorRect = $ColouredBar
@onready var label: Label = $Label

func _ready() -> void:
	maxHealth = character.health
	colouredBar.size.x = (float(character.health) / float(maxHealth)) * 40
	label.text = str(character.health)

func _process(delta: float) -> void:
	# Update the health bar every game frame
	colouredBar.size.x = (float(character.health) / float(maxHealth)) * 40
	label.text = str(character.health)
