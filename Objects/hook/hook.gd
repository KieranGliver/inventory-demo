extends RigidBody2D

class_name Hook

@onready var timer : Timer = $Timer
@export var waitLength : float = 20.0

var tile_map : TileMap
var water_level : float
var is_in_water : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	tile_map = get_parent().get_tile_map()

func _physics_process(delta):
	if !is_in_water:
		check_is_water()

func check_is_water():
	var tile_pos = tile_map.local_to_map(position)
	
	if tile_map != null:
		var tile_data = tile_map.get_cell_tile_data(0,tile_pos)
		if tile_data != null:
			if tile_data.get_custom_data("is_water"):
				in_water()

func in_water():
	is_in_water = true
	water_level = position.y
	freeze = true
	timer.start(waitLength)

