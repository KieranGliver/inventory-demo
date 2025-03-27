extends Area2D

class_name RockBreakable

func _on_mouse_entered():
	SignalManager.mouse_entered_object.emit(self)


func _on_mouse_exited():
	SignalManager.mouse_exited_object.emit(self)
