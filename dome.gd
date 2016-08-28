
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var health = 3;

func _on_dome_body_enter( body ):
	if (body extends preload("res://storm.gd")):
		#get_node("anim").play("damage")
		health -= 1
		if (health == 2):
			get_node("Sprite").play("damaged1")
			get_node("SamplePlayer2D").play("bing", -2)
		elif (health == 1):
			get_node("Sprite").play("damaged2")
			get_node("SamplePlayer2D").play("bing", -2)
		elif (health == 0):
			get_node("Sprite").set_hidden(true)
			get_node("SamplePlayer2D").play("glasbreak", -2)
			get_node("glasparticles").set_emitting(true)
			health -= 1
		else:
			Transition.fade_to("res://gameover.tscn")
	elif (body extends preload("res://water.gd")):
		Transition.fade_to("res://gameover.tscn")
		
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

