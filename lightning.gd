
extends Area2D

# Member variables
var cumdelta = 0
var active = false
var arkbody = null

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	if(active and arkbody != null):
		print("Arkbody parent ", arkbody.get_parent()) 
		get_node("/root/game/atlantis/island/lightningparticles").set_emitting(true)
		
	cumdelta += delta
	if (cumdelta > 5):
		cumdelta = 0
		get_node("AnimationPlayer").play("strike")
		get_node("sounds").play("lightning", -2)
		active = true


func _on_AnimationPlayer_finished():
	active = false


func _on_Area2D_body_enter( body ):
	if (body extends preload("res://island.gd")):
		arkbody = body


func _on_Area2D_body_exit( body ):
	if (body extends preload("res://island.gd")):
		arkbody = null
