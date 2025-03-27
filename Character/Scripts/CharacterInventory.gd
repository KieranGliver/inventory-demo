extends Node

@export var resources : Dictionary = { }

func add_resources(type : ResourceItem, amount : int):
	if(resources.has(type)):
		resources[type] = resources[type] + amount
	else:
		resources[type] = amount
