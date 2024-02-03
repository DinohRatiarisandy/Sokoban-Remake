extends Area2D

var occupied : bool = false;

func _on_body_entered(_body):
	occupied = true;


func _on_body_exited(_body):
	occupied = false;
