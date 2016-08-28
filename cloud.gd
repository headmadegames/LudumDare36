
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Sprite").set_scale(Vector2(1.75 + randf()*0.5, 1.75 + randf()*0.5))
	get_node("Sprite").set_flip_v(bool(randi() % 2))
	get_node("Sprite").set_flip_h(bool(randi() % 2))
	#get_node("AnimationPlayer").queue("move")

