
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var talking = false
var timeout = 0;
var speechPos = 0
var speech = ["Dear citizens of Atlantis\nI have good news and I have bad news.",
"The good news is that my arms are perfectly normal.",
"The bad news is that a meteor is headed for earth.",
"We believe it will wipe out all intelligent life.",
"Only cockroaches and warmblooded vermin will survive.",
"But do not panic\nWe devised a plan to save us all.",
"We will launch Atlantis into space and colonize a new planet.",
] 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	if (Input.is_action_pressed("ui_cancel")):
			Transition.fade_to("res://game.tscn")
		
	timeout += delta
	if (timeout > 1 and (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("jetright") or Input.is_action_pressed("jetleft"))):
		timeout = 0
		if(speechPos >= speech.size()):
			Transition.fade_to("res://game.tscn")
		else:
			get_node("AnimationPlayer").play("talk")
			get_node("sound").play("roar", -2)
			get_node("text").set_text(speech[speechPos])
			speechPos += 1


