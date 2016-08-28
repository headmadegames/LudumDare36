
extends Particles2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print("Velo", get_parent().get_linear_velocity().y)
	set_param(2, get_parent().get_linear_velocity().y)
	


