extends Control


@onready var level_index = $TextureRect/VBoxContainer/HBoxContainer/LevelIndex
@onready var current_level = $".."


func _on_play_pressed():
	GameData.current_level = level_index.value - 1
	current_level.change_level()
	self.hide()
