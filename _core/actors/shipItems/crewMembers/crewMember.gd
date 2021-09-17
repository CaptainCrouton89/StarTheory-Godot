extends "res://_core/actors/shipItems/shipItem.gd"

var _in_use = false

var speed
var potency

func is_type(t):
	return t == "TYPE_CREWMEMBER" or .is_type(t)
func get_type():
	return "TYPE_CREWMEMBER"

func _ready():
	pass

func init(config):
	.init(config)
	self.speed = config["speed"]
	self.potency = config["potency"]


func is_in_use():
	return self._in_use
	

func is_cooling_down():
	return self._cooling_down


func use(time) -> bool:
	self._in_use = true
	return true
	

func launch(time) -> bool:
	self._in_use = false
	return true
	
	
func release() -> bool:
	self._in_use = false
	return true
	
	

