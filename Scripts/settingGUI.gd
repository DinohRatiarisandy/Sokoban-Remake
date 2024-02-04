extends Control


@onready var texture_rect = $TextureRect
@onready var panel = $Panel
@onready var player = $"../Player"
@onready var current_level = $"../../"

func _ready():
	texture_rect.visible = false
	panel.visible = false

func _on_go_to_main_menu_pressed():
	get_tree().reload_current_scene()


func _on_retry_pressed():
	current_level.change_level()



func _on_setting_button_pressed():
	texture_rect.visible = !texture_rect.visible
	panel.visible = !panel.visible
	player.stop_game = !player.stop_game
