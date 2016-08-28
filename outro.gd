
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var talking = false
var timeout = 0;
var speechPos = 0
var speech = ["Dear citizens of Atlantis.",
"We did it!\n\nROAR YEAH!",
"We leave our home behind but who cares.",
"It was polluted anyway.\nLet the vermin have it.",
"We will find a new home for Trumposaurkind.",
"ROAR YEAH!\n\nThe End"
] 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	timeout += delta
	if (timeout > 1 and (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("jetright") or Input.is_action_pressed("jetleft"))):
		timeout = 0
		if(speechPos >= speech.size()):
			pass#Transition.fade_to("res://game.tscn")
		else:
			get_node("AnimationPlayer").play("talk")
			get_node("sound").play("roar", -2)
			get_node("text").set_text(speech[speechPos])
			speechPos += 1


