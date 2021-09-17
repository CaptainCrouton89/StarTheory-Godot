extends "res://_core/actors/shipItems/modules/module.gd"

var speed

func _ready():
	pass


func init(config):
	.init(config)
	self.speed = config["speed"]
	return self
