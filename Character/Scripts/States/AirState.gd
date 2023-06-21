extends State

class_name AirState

# can move

func state_process(delta):
	# Ensures proper animation while in air state
	if character.velocity.y > 0:
		playback.travel(character_state_machine.down_animation)
	elif playback.get_current_node() != character_state_machine.jump_animation:
		playback.travel(character_state_machine.up_animation)
	
		# When on floor switch to landing state
	if character.is_on_floor():
		switch_state(landing_state, character_state_machine.land_animation)
