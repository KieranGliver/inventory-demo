extends State

class_name LandingState

# can move

# Switches state to ground state when animation finishes
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == character_state_machine.land_animation):
		switch_state(ground_state, character_state_machine.move_animation)

# Cancel landing animation with movement or a jump at any time
func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		switch_state(air_state, character_state_machine.jump_animation)
	if(event.is_action_pressed("left") || event.is_action_pressed("right")):
		switch_state(ground_state, character_state_machine.move_animation)
