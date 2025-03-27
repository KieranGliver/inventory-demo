extends Button

class_name Chest 

@export var amount = 1
@export var inventory_name : String
@export var items : Array[String]

var inventory : Inventory

func _init():
	inventory = preload("res://Inventory/UI/inventory.tscn").instantiate()

func _ready():
	inventory.capacity = amount
	inventory.inventory_name = inventory_name
	set_items()

func set_items():
	for i in items:
		inventory.add_item(ItemManager.get_item(i))

func _on_pressed():
	SignalManager.inventory_opened.emit(inventory)
