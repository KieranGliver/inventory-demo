extends RigidBody2D

class_name Pickup

@export var resource_type : Resource
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_fish(rng.randi_range(0,7))

func set_fish(index : int):
	var fishes = ["fish_0", "fish_1", "fish_2", "fish_3", "fish_4", "fish_5", "fish_6", "fish_7"]
	animated_sprite.play(fishes[index])
	resource_type = load("res://Resources/resource_" + fishes[index] + ".tres")

func _on_body_entered(body):
	# print(name + " collided with " + body.name)
	var inventory = body.find_child("Inventory")
	
	if (inventory):
		inventory.add_resources(resource_type, 1)
		queue_free()
	
