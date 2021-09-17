extends Camera2D
class_name ShakeCamera2D

export var decay = 2  # How quickly the shaking stops [0, 1].
export var max_offset = Vector2(5, 5)  # Maximum hor/ver shake in pixels.
export var max_roll = 0.1  # Maximum rotation in radians (use sparingly).


var pos = position
var trauma = 0

var shake_factor = 1.1  # Trauma exponent. Use [2, 3].


func _ready():
	pass


func _process(delta):
	position = pos
	if trauma >= 0:
		trauma = max(trauma - decay * delta, 0)
		shake()
		
func shake():
	var amount = pow(trauma, shake_factor)
	# Using noise
	rotation = max_roll * amount * RNG.rng.randf_range(-1, 1)
	offset.x = max_offset.x * amount * RNG.rng.randf_range(-1, 1)
	offset.y = max_offset.y * amount * RNG.rng.randf_range(-1, 1)
	# Pure randomness
#	rotation = max_roll * amount * rand_range(-1, 1)
#	offset.x = max_offset.x * amount * rand_range(-1, 1)
#	offset.y = max_offset.y * amount * rand_range(-1, 1)
	
func add_trauma(amount):
	trauma = amount
	
