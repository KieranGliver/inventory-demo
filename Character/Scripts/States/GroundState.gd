extends State

class_name GroundState

# can move

@export var launcher : PackedScene

func state_process(delta):
	if !character.is_on_floor():
		switch_state(air_state, character_state_machine.jump_animation)

func state_input(event : InputEvent):
	if event is InputEventMouseButton:
		# left mouse pressed
		if event.button_index == 1 and event.pressed:
			# begin launching if mouse inside character
			if character.velocity == Vector2.ZERO:
				if MouseHoverManager.hover == character:
					switch_state(casting_state, character_state_machine.casting_animation)
				elif MouseHoverManager.hover is RockBreakable:
					switch_state(mining_state, character_state_machine.mining_animation)
	
	
	if(event.is_action_pressed("jump")):
		switch_state(air_state, character_state_machine.jump_animation)
