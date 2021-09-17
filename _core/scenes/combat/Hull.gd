extends TextureProgress

onready var ship = Game.player.get_ship()

func _ready():
	self.max_value = ship._base_hull_armor


func _process(delta):
	self.value = ship._hull_armor
	
