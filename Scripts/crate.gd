class_name Crate

extends CharacterBody2D

@export var crate_type : int = 0

@onready var ray_cast_2d = $RayCast2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var inputs = {"move_right": Vector2.RIGHT, "move_left": Vector2.LEFT, "move_up": Vector2.UP, "move_down": Vector2.DOWN}

const STEP = 64

func _ready():
	animated_sprite_2d.frame = crate_type


func can_move(dir):
	var new_pos = inputs[dir] * STEP
	ray_cast_2d.target_position = new_pos
	ray_cast_2d.force_raycast_update()
	
	var collider = ray_cast_2d.get_collider()
	
	if !collider:
		animate_movement(self.position + new_pos)
		return true
	else:
		return false


func animate_movement(new_pos: Vector2):
	var tween = self.create_tween()
	tween.tween_property(self, "position", new_pos, 0.12)
