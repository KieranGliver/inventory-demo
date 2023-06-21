extends State

class_name CatchState

# can't move

# Switches states when catch animation finishes
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == character_state_machine.catch_animation):
		next_state = ground_state
