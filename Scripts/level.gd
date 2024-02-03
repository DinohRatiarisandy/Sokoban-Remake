extends Node2D

@onready var level_completed = $LevelCompleted


func _process(_delta):
	var spot_count = $Targets.get_child_count()
	
	for target in $Targets.get_children():
		if target.occupied:
			spot_count -= 1

		if spot_count == 0:
			level_completed.visible = true;


func _on_level_completed_next_level():
	GameData.current_level += 1;
	get_parent().change_level()


func _on_level_completed_retry_level():
	get_parent().change_level()
