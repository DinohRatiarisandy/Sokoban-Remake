extends Node2D

@onready var player = $Player
@onready var gui_level_completed = $"../GUILevelCompleted"

func _process(_delta):
	var spot_count = $Targets.get_child_count()
	
	for target in $Targets.get_children():
		if target.occupied:
			spot_count -= 1

		if spot_count == 0:
			gui_level_completed.visible = true
			player.stop_game = true
			$SettingGUI.visible = false
