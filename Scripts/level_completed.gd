extends ColorRect

signal next_level
signal retry_level


func _on_retry_pressed():
	retry_level.emit()

func _on_next_pressed():
	next_level.emit()
