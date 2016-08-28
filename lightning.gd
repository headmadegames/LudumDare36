
extends Area2D

# Member variables
var cumdelta = 0
var active = false

func _on_body_enter( body ):
	if (active and body extends preload("res://island.gd")):
		pass#body.
		
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	cumdelta += delta
	if (cumdelta > 5):
		cumdelta = 0
		get_node("AnimationPlayer").play("strike")
		get_node("sounds").play("lightning", -2)
		active = true


func _on_AnimationPlayer_finished():
	active = false
