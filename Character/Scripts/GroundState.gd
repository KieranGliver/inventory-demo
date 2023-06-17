extends State

class_name GroundState

@export var jump_velocity : float = -150.0

@export var air_state : State
@export var fishing_state : State

@export var jump_animation : String = "jump_start"
@export var fishing_animation : String = "fishing"

func state_process(delta):
	if !character.is_on_floor():
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("fish")):
		fish()

func jump():
	character.velocity.y = jump_velocity
	playback.travel(jump_animation)
	next_state = air_state

func fish():
	playback.travel(fishing_animation)
	next_state = fishing_state
