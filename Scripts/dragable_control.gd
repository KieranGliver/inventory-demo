extends ScaleControl

class_name DragableControl

@export var safe_zone : int = 30

var screen_size : Vector2
var dragging : bool = false
var offset : Vector2

func _ready():
	super._ready()
	gui_input.connect(_on_gui_input)

func _process(delta):
	if dragging:
		set_pos(get_viewport().get_mouse_position() - offset)

func set_scale_val(value):
	super.set_scale_val(value)
	screen_size = get_viewport().get_visible_rect().size
	set_pos(position)

func set_pos(pos):
	var scaled_size = size * scale
	pos.x = clamp(pos.x, -scaled_size.x + safe_zone, screen_size.x - safe_zone)
	pos.y = clamp(pos.y, -scaled_size.y + safe_zone, screen_size.y - safe_zone)
	position = pos

func _on_gui_input(event):
	if ! dragging and event.is_action_pressed("left_mouse_press"):
		var mouse_pos = get_viewport().get_mouse_position()
		offset = mouse_pos - position
		dragging = true
		get_viewport().set_input_as_handled()
		get_parent().move_child(self, get_parent().get_child_count()-1)

	if dragging and event.is_action_released("left_mouse_press"):
		dragging = false
		get_viewport().set_input_as_handled()
		z_index = 0
