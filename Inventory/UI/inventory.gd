extends NinePatchRect

class_name Inventory

var inventory_slot_res = preload("res://Inventory/UI/inventory_slot.tscn")

@export var inventory_name : String
@export var capacity : int = 0 : set = set_inventory_capacity

@onready var title : Label = $TextureRect/Label
@onready var slot_container : Control = $SlotContainer

var slots : Array = []

func _ready():
	for s in slots:
		slot_container.add_child(s)
	
	title.text = "- " + inventory_name + " -"
	SignalManager.emit_signal("inventory_ready", self)


func set_inventory_capacity(value):
	capacity = value
	custom_minimum_size.y = 56 + (ceil(capacity / 5.0)-1) * 40
	for s in capacity:
		var new_slot = inventory_slot_res.instantiate()
		slots.append(new_slot)

func add_item(item):
	for s in slots:
		if not s.item:
			s.set_item(item)
			return
