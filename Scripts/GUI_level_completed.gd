extends CanvasLayer

@onready var current_level = $".."

func _on_retry_pressed():
	current_level.change_level()
	self.visible = false


func _on_next_pressed():
	GameData.current_level += 1;
	current_level.change_level()
	self.visible = false
