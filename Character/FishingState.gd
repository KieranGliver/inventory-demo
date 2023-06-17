extends State

class_name FishingState

var fish : bool = false
@onready var timer : Timer = $FishTimer

@export var waitLength : float = 20.0

@export var icon : Sprite2D
@export var air_state : State
@export var ground_state : State
@export var catch_state : State

@export var jump_animation : String = "jump_start"
@export var move_animation : String = "Move"
@export var catch_animation : String = "catch"

func on_enter():
	timer.start(waitLength)

func on_exit():
	icon.visible = false
	fish = false
	timer.stop()

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("left") || event.is_action_pressed("right")):
		cancel()
	if(event.is_action_pressed("fish") && fish):
		catch()

func jump():
	character.velocity.y = ground_state.jump_velocity
	playback.travel(jump_animation)
	next_state = air_state

func cancel():
	playback.travel(move_animation)
	next_state = ground_state

func catch():
	icon.visible = false
	playback.travel(catch_animation)
	next_state = catch_state


func _on_timer_timeout():
	fish = true
	icon.visible = true
