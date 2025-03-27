extends InventorySlot

class_name EquipmentSlot

@onready var placeholder = $Placeholder

@export var type : GameEnums.EQUIPMENT_TYPE

func _ready():
	super._ready()
	placeholder.texture = ItemManager.get_placeholder(type)

func set_item(new_item):
	super.set_item(new_item)
	placeholder.hide()
	
func pick_item():
	super.pick_item()
	placeholder.show()

func put_item(new_item):
	super.put_item(new_item)
	placeholder.hide()
