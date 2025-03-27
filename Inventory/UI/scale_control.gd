extends Control

class_name ScaleControl

var scale_val : float

func _ready():
	SignalManager.ui_scale_changed.connect(on_ui_scale_changed)
	set_scale_val(SettingsManager.scale_val)

func set_scale_val(value):
	scale_val = value
	scale = Vector2(scale_val, scale_val)

func on_ui_scale_changed(value):
	set_scale_val(value)
