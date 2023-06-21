extends State

class_name CasterState

@export var hook : PackedScene

var hook_instance : Hook
# can't move

func state_input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == 1 && !event.pressed:
			cast_event()
			switch_state(fishing_state, character_state_machine.fishing_animation)


func cast_event():
	if hook_instance != null:
		hook_instance.queue_free()
	hook_instance = character.spawn_instance(hook, character.get_parent(), character.position + character.get_r_position())
	hook_instance.apply_impulse(mouse_to_character())
	fishing_state.hook_instance = hook_instance

# returns normailized direction * distance of mouse to character
func mouse_to_character():
	return get_viewport().get_mouse_position().direction_to(character.global_position) * get_viewport().get_mouse_position().distance_to(character.global_position)
