extends Node2D

func change_level():
	for child in self.get_children():
		if child == $Background or child == $GUILevelCompleted or child == $MainMenu:
			continue
		child.queue_free()

	# Make sure all levels in loop
	var current_level = GameData.levels[GameData.current_level % GameData.levels.size()]
	self.add_child(current_level.instantiate())
