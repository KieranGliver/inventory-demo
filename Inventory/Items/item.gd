extends TextureRect

class_name Item

@export var id : String
@export var item_name : String


func pick_item():
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func put_item():
	mouse_filter = Control.MOUSE_FILTER_PASS
