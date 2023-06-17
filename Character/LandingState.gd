extends State

class_name LandingState

@export var air_state : State
@export var ground_state : State

@export var jump_animation : String = "jump_start"
@export var move_animation : String = "Move"
@export var landing_animation : String = "land"

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("left") || event.is_action_pressed("right")):
		cancel()

func jump():
	character.velocity.y = ground_state.jump_velocity
	playback.travel(jump_animation)
	next_state = air_state

func cancel():
	playback.travel(move_animation)
	next_state = ground_state

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == landing_animation):
		cancel()

