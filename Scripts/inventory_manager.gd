extends Node

class_name InventoryManager

@onready var item_in_hand_node = $"../../UI/UIContainer/ItemInHand"
@onready var item_info = $"../../UI/UIContainer/ItemInfo"

var inventories : Array = []
var item_in_hand = null
var item_offset = Vector2(16,16)

func _ready():
	SignalManager.inventory_ready.connect(_on_inventory_ready)
	

func _on_inventory_ready(inventory):
	inventories.append(inventory)
	
	for slot in inventory.slots:
		slot.mouse_entered.connect(_on_mouse_entered_slot.bind(slot))
		slot.mouse_exited.connect(_on_mouse_exited_slot)
		slot.gui_input.connect(_on_gui_input_slot.bind(slot))

func _input(event):
	if event is InputEventMouseMotion and item_in_hand:
		item_in_hand.position = event.position + event.relative - item_offset

func _on_mouse_entered_slot(slot : InventorySlot):
	if slot.item:
		item_info.display(slot)

func _on_mouse_exited_slot():
	item_info.hide()

func _on_gui_input_slot(event : InputEvent, slot : InventorySlot):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if item_in_hand:
			item_in_hand_node.remove_child(item_in_hand)
			if slot.item:
				var temp_item = slot.item
				slot.pick_item()
				temp_item.position = item_in_hand.global_position
				slot.put_item(item_in_hand)
				item_in_hand = temp_item
				item_in_hand_node.add_child(item_in_hand)
			else:
				slot.put_item(item_in_hand)
				item_in_hand = null
		elif slot.item:
			item_in_hand = slot.item
			item_offset = event.position - item_in_hand.position
			item_in_hand.position = item_in_hand.global_position
			slot.pick_item()
			item_in_hand_node.add_child(item_in_hand)
