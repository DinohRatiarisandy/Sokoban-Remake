class_name Player

extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var ray_cast_2d = $RayCast2D

var inputs = {"move_right": Vector2.RIGHT, "move_left": Vector2.LEFT, "move_up": Vector2.UP, "move_down": Vector2.DOWN}
var step : int;

func _ready():
	step = sprite_2d.get_rect().size.x


func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	var new_pos = inputs[dir] * step
	ray_cast_2d.target_position = new_pos
	ray_cast_2d.force_raycast_update()
	
	var collider = ray_cast_2d.get_collider()
	
	# if player is not collide with anything, he can move
	if !collider:
		self.position += new_pos
	else:
		if collider is Crate and collider.can_move(dir):
			collider.position += inputs[dir]*step
			self.position += new_pos
