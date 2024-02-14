class_name Player

extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D
@onready var hurt_sound = $SoundManager/HurtSound
@onready var slide = $SoundManager/Slide
@onready var move_sound = $SoundManager/MoveSound

var inputs = {"move_right": Vector2.RIGHT, "move_left": Vector2.LEFT, "move_up": Vector2.UP, "move_down": Vector2.DOWN}
var stop_movement : bool = false;

const STEP = 64


func _unhandled_input(event):
	if !stop_movement:
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
		animate_movement(self.position + new_pos)
		move_sound.play()
	else:
		if collider is Crate and collider.can_move(dir):
			collider.animate_movement(collider.position + new_pos)
			animate_movement(self.position + new_pos)
			slide.play()
		else:
			hurt_sound.play()


func animate_movement(new_pos: Vector2):
	var tween = self.create_tween()
	tween.tween_property(self, "position", new_pos, 0.12)
	
	stop_movement = true
	
	await tween.finished

	stop_movement = false
