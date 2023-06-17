extends State

class_name CatchState

@export var catch_animation : String = "catch"
@export var ground_state : State

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == catch_animation):
		next_state = ground_state
