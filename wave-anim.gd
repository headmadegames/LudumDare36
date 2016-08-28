
extends AnimationPlayer

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if is_playing():
    	advance(rand_range(1,6))
	else:
		play("move", -1, 1.0, false)
		advance(rand_range(1,6))


