extends DragableControl

class_name InventoryContainer

@onready var inventory_container : Control = $InventoryContainer

var current_inventories : Array = []

func _ready():
	super._ready()
	SignalManager.inventory_opened.connect(_on_inventory_opened)
	

func close():
	for i in current_inventories:
		inventory_container.remove_child(i)
	
	current_inventories = []
	hide()

func _on_inventory_opened(inventory : Inventory):
	if current_inventories.size() == 0:
		size.y = 20
	
	if current_inventories.has(inventory):
		return
	
	inventory_container.add_child(inventory)
	current_inventories.append(inventory)
	size.y += inventory.size.y + inventory_container.get_theme_constant("separation")
	show()


func _on_close_button_pressed():
	close()
