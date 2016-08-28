
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
	var sample = get_node("island/sounds").get_sample_library().get_sample("jet")
	sample.set_loop_format(sample.LOOP_PING_PONG)
	sample.set_loop_begin(0)
	sample.set_loop_end(sample.get_length())
	get_node("island/sounds").voice_set_volume_scale_db(0, -60);
	get_node("island/sounds").play("jet")

func _process(delta):
	
	if (Input.is_action_pressed("ui_cancel")): 
		Transition.fade_to("res://game.tscn")
	
	var impulse = Vector2(0,-2).rotated(get_node("island").get_rot())
	var playSound = false
	if (Input.is_action_pressed("jetleft")):
		get_node("island/jetleft").set_emitting(true)
		get_node("island").apply_impulse(get_node("island/jetleft").get_pos().rotated(get_node("island").get_rot()), impulse)
		playSound = true
	else:
		get_node("island/jetleft").set_emitting(false)
	
	if (Input.is_action_pressed("jetright")):
		get_node("island/jetright").set_emitting(true)
		get_node("island").apply_impulse(get_node("island/jetright").get_pos().rotated(get_node("island").get_rot()), impulse)
		playSound = true
		#print("island rot", get_node("island").get_rot())
		#print("impulse ", impulse);
	else:
		get_node("island/jetright").set_emitting(false)
		
	if (playSound):
		get_node("island/sounds").voice_set_volume_scale_db(0, 0)
	else:
		get_node("island/sounds").voice_set_volume_scale_db(0, -60)
