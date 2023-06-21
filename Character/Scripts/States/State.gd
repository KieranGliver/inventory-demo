extends Node

class_name State

@export var can_move : bool = true

var character_state_machine : CharacterStateMachine
var character : Player
var playback : AnimationNodeStateMachinePlayback
var next_state : State

var  ground_state : State
var air_state : State
var fishing_state : State
var catch_state : State
var landing_state : State
var casting_state : State
var reeling_state : State

func state_process(delta):
	pass

func state_input(event : InputEvent):
	pass

func on_enter():
	pass

func on_exit():
	pass

func switch_state(state : State, animation : String):
	playback.travel(animation)
	next_state = state
