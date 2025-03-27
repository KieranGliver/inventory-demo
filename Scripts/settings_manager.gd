extends Node

var fullscreen : set = set_fullscreen
var scale_val : set = set_scale_val

func _ready():
	scale_val = 1
	fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN

func set_fullscreen(value):
	fullscreen = value
	if value:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func set_scale_val(value):
	scale_val = value
	SignalManager.ui_scale_changed.emit(value)
