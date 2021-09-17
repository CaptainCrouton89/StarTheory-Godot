extends TextureProgress

onready var ship = Game.player.get_ship()

func _ready():
	self.max_value = ship._base_energy_shields


func _process(delta):
	self.value = ship._energy_shields
	
