extends Node

var planets
var star_system

func _ready():
	pass
	
func add(planet, l):
	self.planets[l] = planet

func gen_planets():
	# Loops through empty data structure and fills it with stars, and the for each star, generates planets
	for l in range(self.planets.size()):
		var current_planet = load("res://_core/actors/galaxy/stars/planets/planet.tscn").instance()
		current_planet.init(self.star_system, l)
		self.add(current_planet, l)
	return self.planets

func init(layers):
	self.star_system = get_parent()
	self.planets = []
	for l in layers:
		self.planets.append(0)
