extends Node

var contents = []


func _ready():
	pass


func add(ship):
	contents.append(ship)


func get_contents() -> Array:
	return self.contents
