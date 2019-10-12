extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var namePlane
var typePlane
var dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():	
	var file = File.new()
	file.open("res://assets/config/planeConfig.json", file.READ)
	var text = file.get_as_text()	
	dict = JSON.parse(text).result	
	print(dict['planes'])
	file.close()	


var motion = Vector2()
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x =500
		motion.y=0
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_left"):
		motion.x =-500
		motion.y=0
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_up"):
		motion.y =-500
		motion.x =0
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_down"):
		motion.y =500
		motion.x=0
		move_and_slide(motion)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
