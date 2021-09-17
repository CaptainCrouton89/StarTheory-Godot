extends Node

var _reputation
var _honor
var _actionAffinity

var _location

func _ready():
	pass

func set_location(location):
	self._location = location
	
func get_location(): # add a return type
	return self._location
