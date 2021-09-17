extends Node

var planet
var satellites = []

func _ready():
	pass
	
func add(satellite, l):
	self.satellites[l] = satellite
	
func init(layers):
	self.planet = get_parent()
	self.satellites = []
	for l in layers:
		self.satellites.append(0)


func gen_satellites():
	# Loops through empty data structure and fills it with stars, and the for each star, generates planets
	for l in range(self.satellites.size()):
		var current_satellite = load("res://_core/actors/galaxy/stars/planets/satellites/satellite.tscn").instance()
		current_satellite.init(self.planet, l)
		self.add(current_satellite, l)
	return self.satellites

