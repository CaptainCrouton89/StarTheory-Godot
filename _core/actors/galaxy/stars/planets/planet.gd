extends Node2D

var display_name = "defaultPlanetName"
var SPRITE_POOL_MAX = 14
var rng = RandomNumberGenerator.new()
var star_system
var layer
var faction
var LAYER_DEPTH = 90 # Pixel distance apart each planet is from the next
var sprite_num
	
var orbital_speed
var angular_speed

var static_stats

func _ready():
	self.description = "defaultPlanetDescription"
	
	# Orbiting ships
	self.shipManager = $"shipManager"

	# Planet inventories
	self.cargoMarket = $"cargoMarket"
	self.upgradesMarket = $"upgradesMarket"
	self.modulesMarket = $"modulesMarket"
	self.crewMarket = $"crewMarket"
	self.jobMarket = $"jobMarket"
	

func init(star_system, layer):
	
	$satelliteManager.init(3)
	$satelliteManager.gen_satellites()
	
	self.star_system = star_system
	self.display_name = "defaultPlanetName" + String(layer)
	self.layer = layer
	
	# Sprite Info
	self.LAYER_DEPTH = 90 # Pixel distance apart each planet is from the next

	var sprite_num = int(round(rng.randf()*SPRITE_POOL_MAX))
	
	self.orbital_speed = (1/(self.layer + 1)) * 7; 
	self.angular_speed = rng.randf_range(-1, 1) * 30 - self.orbital_speed;

	self.static_stats = {
		"temperatureLevel": 1/(self.layer + 1),
		"resources": {},
		"resourceScore": 0,
		"population": 0,
		"traffic": 0,
		"wealth": 0,
		"skill": 0,
		"orbitalStation": false,
		"settlementType": null,
	}
	

#		self.selectedOptions = {
#			"v": [this.visit, this]
#		}
#
#		this.visitedOptions = {
#			"t": [this.trade, this],
#			"q": [this.quest, this]
#		}
#	}

#	getSelectionOptions () {
#		return this.selectedOptions;
#	}
#
#	getVisitOptions () {
#		return this.visitedOptions;
#	}
