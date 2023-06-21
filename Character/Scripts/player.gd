extends CharacterBody2D

class_name Player

@export var speed : float = 200.0
@export var jump_velocity : float = -200.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var collision_shape : CollisionShape2D = $CollisionShape2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : float = 0.0
var mouse_inside : bool = false

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	update_velocity(delta)
	move_and_slide()
	update_animation_parameters()
	if state_machine.check_if_can_move():
		update_facing_direction()

func update_velocity(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_axis("left", "right")
	if not Input.is_action_pressed("shift"):
		direction = direction * 0.5
	
	# Control whether to move or not to move
	if state_machine.check_if_can_move() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity 
	if direction != 0 && state_machine.check_if_can_move():
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed*0.1)

func update_animation_parameters():
	animation_tree.set("parameters/Move/blend_position", direction)

func update_facing_direction():
	if direction > 0:
		sprite.flip_h = false
		sprite.offset.x = 0
	elif direction < 0:
		sprite.flip_h = true
		sprite.offset.x = -14

func get_facing_direction():
	return sprite.flip_h

func get_r_position():
	return collision_shape.position

func spawn_instance(packed_scene : PackedScene, parent : Node, r_position : Vector2):
	var instance = packed_scene.instantiate()
	parent.add_child(instance)
	instance.position = r_position
	return instance

func _on_mouse_entered():
	mouse_inside = true

func _on_mouse_exited():
	mouse_inside = false
