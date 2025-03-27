extends Control

@onready var settings = $Windows/Settings

func _on_settings_pressed():
	settings.visible = !settings.visible
	settings.get_parent().move_child(settings, settings.get_parent().get_child_count()-1)
