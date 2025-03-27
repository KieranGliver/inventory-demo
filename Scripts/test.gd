extends Button

@export var scale_val : float

func _on_pressed():
	SignalManager.ui_scale_changed.emit(scale_val)
