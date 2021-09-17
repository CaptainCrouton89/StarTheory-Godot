extends Node2D

var planet
var layer

func _ready():
	pass

func init(planet, layer):
	self.planet = planet
	self.layer = layer
