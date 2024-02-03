extends Node2D


func change_level():
	for child in self.get_children():
		child.queue_free()
	
	var current_level = GameData.levels[GameData.current_level % GameData.levels.size()]
	self.add_child(current_level.instantiate())
