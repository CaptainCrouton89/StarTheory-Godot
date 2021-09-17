extends Node

var star_systems
var galaxy
var layers
var degrees

func _ready():
	pass
	
func add(star_system, l, d):
	self.star_systems[l][d] = star_system

func gen_stars():
	print("Generating stars and planets...")

	# Loops through empty data structure and fills it with stars, and the for each star, generates planets
	for l in range(layers):
		for d in range(degrees):
			var current_star_system = load("res://_core/actors/galaxy/stars/starSystem.tscn").instance()
			current_star_system.init(self.galaxy, l, d)
			self.add(current_star_system, l, d)
	return self.star_systems
		
func init(layers, degrees):
	self.layers = layers
	self.degrees = degrees
	self.galaxy = get_parent()
	self.star_systems = []
	for l in layers:
		var layer = []
		for d in degrees:
			layer.append(d)
		self.star_systems.append(layer)
