extends Node2D

class_name ReelGameController

var outline_ratio : float = 0.03125
var green_ratio : float = 0.125

var outline_max_x : float = 0.0
var green_max_x : float = 0.0
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

var green_velocity : float = 0.0
var bar_velocity : float = 0.0

var scoring : bool = false
var score : float = 3.0

@export var max_bar_velocity : float = 3.0

@onready var middle_bar : Node2D = $MiddleBar
@onready var left_bar : Node2D = $LeftBar
@onready var right_bar : Node2D = $RightBar
@onready var green_bar : Area2D = $GreenBar
@onready var bar : Area2D = $Bar

signal fish_caught

func _ready():
	set_outline_bar_width(32)
	set_green_bar_width(8)

func _process(delta):
	if score > 0:
		if scoring:
			score = score - delta
	else:
		fish_caught.emit()
		queue_free()

func _physics_process(delta):
	update_green_velocity(delta)
	apply_green_velocity()
	update_bar_velocity(delta)
	apply_bar_velocity()

func update_bar_velocity(delta):
	var accel = Input.get_axis("left","right")*3
	if bar.position.x - 2 <= -outline_max_x:
		bar_velocity = maxf(0.0, accel*delta)
	elif bar.position.x + 2 >= outline_max_x:
		bar_velocity = minf(0.0, accel*delta)
	else:
		bar_velocity = clamp(bar_velocity+accel*delta,-max_bar_velocity,max_bar_velocity)
	bar_velocity = bar_velocity * 0.95

func apply_bar_velocity():
	bar.position.x = bar.position.x + bar_velocity

func update_green_velocity(delta):
	var accel = rng.randf_range(-5,5)
	if green_bar.position.x - green_max_x <= -outline_max_x:
		green_velocity = maxf(0.0, accel*delta)
	elif green_bar.position.x + green_max_x >= outline_max_x:
		green_velocity = minf(0.0, accel*delta)
	else:
		green_velocity = green_velocity+accel*delta

func apply_green_velocity():
	green_bar.position.x = green_bar.position.x + green_velocity

func set_outline_bar_width(bar_width):
	middle_bar.scale.x = outline_ratio*bar_width
	outline_max_x = bar_width/2
	left_bar.position.x = -outline_max_x-2
	right_bar.position.x = outline_max_x+2

func set_green_bar_width(green_width):
	green_bar.scale.x = green_ratio*green_width
	green_max_x = green_width/2

func _on_green_bar_area_entered(area):
	if area.name == "Bar":
		scoring = true

func _on_green_bar_area_exited(area):
	if area.name == "Bar":
		scoring = false


