
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _on_start_pressed():
	pass#get_node("Label").set_text("HELLO!")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	var sample = get_node("windsound").get_sample_library().get_sample("wind")
	sample.set_loop_format(sample.LOOP_PING_PONG)
	sample.set_loop_begin(0)
	sample.set_loop_end(sample.get_length())
	#get_node("windsound").voice_set_volume_scale_db(0, 0);
	get_node("windsound").play("wind")
#    get_node("splashscreen").get_node("Button").connect("pressed",self,"_on_start_pressed")

func _on_goal_body_enter( body ):
	if (body extends preload("res://dome.gd")): 
		print("Goal reached")
		Transition.fade_to("res://outro.tscn")
