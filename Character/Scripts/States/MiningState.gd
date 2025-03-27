extends State

func state_input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == 1 && !event.pressed:
			switch_state(ground_state, character_state_machine.move_animation)
