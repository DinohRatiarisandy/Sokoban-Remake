class_name Player

extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D

var inputs = {"move_right": Vector2.RIGHT, "move_left": Vector2.LEFT, "move_up": Vector2.UP, "move_down": Vector2.DOWN}
var stop_game : bool = false;

const STEP = 64


func _unhandled_input(event):
	if !stop_game:
		for dir in inputs.keys():
			if event.is_action_pressed(dir):
				move(dir)

func move(dir):
	var new_pos = inputs[dir] * STEP
	ray_cast_2d.target_position = new_pos
	ray_cast_2d.force_raycast_update()
	
	var collider = ray_cast_2d.get_collider()
	
	# if player is not collide with anything, he can move
	if !collider:
		self.position += new_pos
	else:
		if collider is Crate and collider.can_move(dir):
			collider.position += inputs[dir]*STEP
			self.position += new_pos
