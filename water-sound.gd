
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	var sample = get_node("sounds").get_sample_library().get_sample("water")
	sample.set_loop_format(sample.LOOP_PING_PONG)
	sample.set_loop_begin(0)
	sample.set_loop_end(sample.get_length())
	get_node("sounds").voice_set_volume_scale_db(0, 0);
	get_node("sounds").play("water")
	


