extends DragableControl

class_name inventory_player

@onready var inventories = $InventoryContainer.get_children()

func _ready():
	super._ready()
	size.y = 20
	for i in inventories:
		size.y += i.size.y + 2

func _on_close_button_pressed():
	hide()
