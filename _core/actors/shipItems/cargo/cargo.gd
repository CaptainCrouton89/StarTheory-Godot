extends "res://_core/actors/shipItems/shipItem.gd"

var base_value
var weight
var legal

func _ready():
	pass
	
	
func is_type(type):
	return type == "TYPE_CARGO" or .is_type(type)
func get_type():
	return "TYPE_CARGO"


func init(config):
	.init(config)
	base_value = config["base_value"]
	weight = config["weight"]
	legal = config["legal"]

	
