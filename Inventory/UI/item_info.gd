extends NinePatchRect

class_name ItemInfo

@onready var item_name = $Title/Label

func display(slot : InventorySlot):
	global_position = slot.size + slot.global_position
	item_name.text = slot.item.item_name
	show()
