extends State

class_name ReelingState

# can't move
@export var reel_height : int = 40
@export var reel_game : PackedScene
@export var fish_pickup : PackedScene

var hook_instance : Hook

func on_enter():
	var reel_instance = character.spawn_instance(reel_game, character, Vector2(character.get_r_position().x, character.get_r_position().x-reel_height))
	reel_instance.fish_caught.connect(reel_on_timer_timeout)

func reel_on_timer_timeout():
	var pickup_instance = character.spawn_instance(fish_pickup, character.get_parent(), hook_instance.position)
	pickup_instance.apply_impulse(fish_force(hook_instance.position, character.position))
	hook_instance.queue_free()
	switch_state(catch_state, character_state_machine.catch_animation)

# y and x using kinematic equations alway lauch towards end at apex
func fish_force(start : Vector2, end : Vector2):
	var fish_force_y = -sqrt(2*character.gravity*(start.y-end.y+32))
	var fish_force_x = (end.x-start.x)/(fish_force_y/-character.gravity)
	return Vector2(fish_force_x, fish_force_y)
