extends TextureProgress

var ship

func _ready():
	pass


func _process(delta):
	ship = self.owner.current_target.get_ship()
	self.max_value = ship._base_hitpoints
	self.value = ship._hitpoints
	
