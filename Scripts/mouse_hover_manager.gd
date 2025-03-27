extends Node

var hover : Node = null
var locked : bool = false
func _ready():
	SignalManager.mouse_entered_object.connect(on_mouse_entered_object)
	SignalManager.mouse_exited_object.connect(on_mouse_exited_object)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			if hover != null:
				locked = true
		if event.button_index == 1 and !event.pressed:
			locked = false

func on_mouse_entered_object(node):
	if hover == null and !locked:
		hover = node
		print(hover)

func on_mouse_exited_object(node):
	if hover == node and !locked:
		hover = null
