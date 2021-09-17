extends Node


var settings
var star_system_manager
var degrees
var layers

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.galaxy = self
	self.star_system_manager = $starSystemManager

func init():
	var config = {"max_degrees": 8, "max_layers": 6}
	
	
	self.degrees = config["max_degrees"]
	self.layers = config["max_layers"]

	self.star_system_manager.init(self.layers, self.degrees)
	self.star_system_manager.gen_stars()
