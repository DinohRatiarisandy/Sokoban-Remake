extends Area2D

var occupied : bool = false;

@onready var crate_in_place_sound = $CrateInPlaceSound

func _on_body_entered(_body):
	occupied = true
	crate_in_place_sound.play()


func _on_body_exited(_body):
	occupied = false
