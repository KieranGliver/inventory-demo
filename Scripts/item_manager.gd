extends Node

@onready var items = {
	"yellow_fish" : preload("res://Inventory/Items/yellow_fish.tscn"),
	"green_fish" : preload("res://Inventory/Items/green_fish.tscn"),
	"blue_fish" : preload("res://Inventory/Items/blue_fish.tscn"),
	"brown_fish" : preload("res://Inventory/Items/brown_fish.tscn"),
}

@onready var placeholders = {
	GameEnums.EQUIPMENT_TYPE.HEAD : preload("res://Sprites/Inventory/UI/placeholder_head.png"),
	GameEnums.EQUIPMENT_TYPE.CHEST : preload("res://Sprites/Inventory/UI/placeholder_chest.png"),
	GameEnums.EQUIPMENT_TYPE.MAIN_HAND : preload("res://Sprites/Inventory/UI/placeholder_main_hand.png"),
	GameEnums.EQUIPMENT_TYPE.OFFHAND : preload("res://Sprites/Inventory/UI/placeholder_offhand.png"),
	}
func get_item(id : String):
	return items[id].instantiate()

func get_placeholder(id):
	return placeholders[id]
