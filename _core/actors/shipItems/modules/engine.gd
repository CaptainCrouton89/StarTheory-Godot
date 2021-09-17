extends "res://_core/actors/shipItems/modules/module.gd"

var max_speed
var acceleration

func _ready():
	pass


func init(config):
	.init(config)
	self.max_speed = config["max_speed"]
	self.acceleration = config["acceleration"]
	return self
