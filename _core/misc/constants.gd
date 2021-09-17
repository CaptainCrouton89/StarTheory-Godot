extends Node

enum orientation {
	FORWARD,
	BROADSIDE,
	AFT
}

enum sound {
	ABOVE,
	BELOW,
	LEFT,
	RIGHT,
	CENTER,
	DISTANT_ABOVE,
	DISTANT_BELOW,
	DISTANT_LEFT,
	DISTANT_RIGHT
}

# Every 6 decibels halves or doubles volume
enum decibels {
	FAINT = -8, 
	QUIET = -4,
	NORMAL = 0,
	LOUD = 4,
	DEAFENING = 8
}

var bus = {
	"MASTER": "Master",
	"DISTANT": "Distant"
}

enum combat_actions {
	MITIGATE,
	ATTACK,
	REPAIR	
}

enum weapon_type {
	ENERGY,
	DEMOLITION,
	KINETIC
}

var energy_damage = {
	"SHIELD_REDUCTION": 0.0,
	"SHIELD_DAMAGE": 0.0,
	"HULL_REDUCTION": 0.5,
	"HULL_DAMAGE": 0.1
}

var demo_damage = {
	"SHIELD_REDUCTION": 0.9,
	"SHIELD_DAMAGE": 0.9,
	"HULL_REDUCTION": 0.9,
	"HULL_DAMAGE": 0.9
}

var kinetic_damage = {
	"SHIELD_REDUCTION": 0.5,
	"SHIELD_DAMAGE": 0.3,
	"HULL_REDUCTION": 0.75,
	"HULL_DAMAGE": 0.9
}

var damage_resistance = {
	"DEMO_HULL_RESIST": 0.2,
	"DEMO_SHIELD_RESIST": .7,
	"KIN_HULL_RESIST": 0.6,
	"KIN_SHIELD_RESIST": 0.3,
	"ENERGY_HULL_RESIST": .4,
	"ENERGY_SHIELD_RESIST": 0
}

var damage_distribution = {
	"DEMO_HULL_DISTR": 0.7,
	"KIN_HULL_DISTR": 0.2,
	"ENERGY_HULL_DISTR": 0.05,
	"DEMO_SHIELD_DISTR": 0.2,
	"KIN_SHIELD_DISTR": 0.7,
	"ENERGY_SHIELD_DISTR": 0.05,
	"DEMO_HP_DISTR": 0.3,
	"KIN_HP_DISTR": 0.3,
	"ENERGY_HP_DISTR": 0.15
}
