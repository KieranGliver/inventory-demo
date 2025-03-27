extends NinePatchRect

@onready var inventory = $InventoryContainer/Inventory

func _ready():
	size.y = 60 + inventory.size.y
