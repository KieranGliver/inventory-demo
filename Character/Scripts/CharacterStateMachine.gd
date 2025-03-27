extends Node

class_name CharacterStateMachine


@export var current_state : State
@export var animation_tree : AnimationTree
@export var character : Player

# List of all player animations
var move_animation : String = "Move"
var jump_animation : String = "jump_start"
var up_animation : String = "up"
var down_animation : String = "down"
var land_animation : String = "land"
var fishing_animation : String = "fishing"
var catch_animation : String = "catch"
var casting_animation : String = "fishing"
var reeling_animation : String = "fishing"
var mining_animation : String = "mining"

var states : Array[State]

func _ready():
	# Add each state to states array
	for child in get_children():
		if(child is State):
			states.append(child)
			# Set the states up with what they need to function
			child.character = character
			child.playback  = animation_tree["parameters/playback"]
			set_states(child)
			child.character_state_machine = self
		else:
			push_warning("Child " + child.name + " is not a State for CharacterStateMachine")

# Switches states if next state exists then run physics of current state
func _physics_process(delta):
	current_state.state_process(delta)
	if(current_state.next_state != null):
		switch_states(current_state.next_state)

# Runs the current state input
func _input(event : InputEvent):
	current_state.state_input(event)

# returns if current state can move
func check_if_can_move():
	return current_state.can_move

# runs on_exit, switches states and runs on_exit
func switch_states(new_state : State):
	
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	
	current_state.on_enter()

# Sets the states to proper variables of state
func set_states(state : State):
	state.air_state = $Air
	state.ground_state = $Ground
	state.fishing_state = $Fishing
	state.catch_state = $Catch
	state.landing_state = $Landing
	state.casting_state = $Casting
	state.reeling_state = $Reeling
	state.mining_state = $Mining
