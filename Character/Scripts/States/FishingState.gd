extends State

class_name FishingState

# can move

var fish : bool = false

@export var icon : Sprite2D

@export var fish_pickup : PackedScene
@export var reel_game : PackedScene

var hook_instance : Hook

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func on_enter():
	hook_instance.get_node("Timer").timeout.connect(hook_on_timer_timeout)

func on_exit():
	hook_instance.get_node("Timer").stop()
	icon.visible = false
	fish = false

func state_input(event : InputEvent):
	if event is InputEventMouseButton:
		
		if event.button_index == 1 and event.pressed:
			if fish:
				reeling_state.hook_instance = hook_instance
				switch_state(reeling_state, character_state_machine.reeling_animation)
			elif character.mouse_inside:
				casting_state.hook_instance = hook_instance
				switch_state(casting_state, character_state_machine.casting_animation)
	
	if(event.is_action_pressed("jump") && can_move):
		hook_instance.queue_free()
		switch_state(air_state, character_state_machine.jump_animation)
	
	if((event.is_action_pressed("left") || event.is_action_pressed("right")) && can_move):
		hook_instance.queue_free()
		switch_state(ground_state, character_state_machine.move_animation)
	
	if(event.is_action_pressed("fish") && fish):
		reeling_state.hook_instance = hook_instance
		switch_state(reeling_state, character_state_machine.reeling_animation)

func hook_on_timer_timeout():
	fish = true
	icon.visible = true
