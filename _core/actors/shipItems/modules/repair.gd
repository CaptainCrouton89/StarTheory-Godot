extends "res://_core/actors/shipItems/modules/module.gd"

var health_per_second
var defense_type

func _ready():
	pass


func init(config):
	.init(config)
	self.health_per_second = config["health_per_second"]
	self.defense_type = config["defense_type"]
	return self
