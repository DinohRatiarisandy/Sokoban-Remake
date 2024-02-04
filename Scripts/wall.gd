extends StaticBody2D

@export var wall_type : int = 0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	animated_sprite_2d.frame = wall_type
