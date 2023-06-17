extends State

class_name AirState

@export var landing_state : State
@export var landing_animation : String = "land"

func state_process(delta):
	if character.is_on_floor():
		next_state = landing_state

	if character.velocity.y > 0:
		playback.travel("down")

func on_exit():
	if next_state == landing_state:
		playback.travel(landing_animation)
