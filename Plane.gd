extends Sprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var planes = {}
var plane
onready var planeAnimator = get_node("PlaneAnimator")
# Called when the node enters the scene tree for the first time.
func _ready():	
	var file = File.new()
	file.open("res://assets/config/planeConfig.json", file.READ)
	var text = file.get_as_text()	
	planes = JSON.parse(text).result
	planes = planes['planes']
	file.close()
	#To get random
	plane = planes[randi() % planes.size()]	
	planeAnimator.play("initAnimation")
	
func getRandomPlane():
	return planes[randi() % planes.size()]

func actualPlane():
	return plane

#getSpriteText(type):
#	match type:
#		1:
#			var typeSprite["res://assets/Img/Avioneta-B.png"]
#			return "res://assets/Img/"
#		2:
#			var typeSprite["res://assets/Img/Militar-B.png"]
#			return "res://assets/Img/"
#		3:
#			var typeSprite["res://assets/Img/Avioneta-B.png"]
#			return "res://assets/Img/"
#		4:
#			var typeSprite["res://assets/Img/Avioneta-B.png"]
#			return "res://assets/Img/"
#
#func setSprite():
#	var textToSprite = "res://assets/Img/"+plane.sprite
#
#    var sprite = preload(textToSprite)
#    onready var contentSprite = get_node("Plane")
#    contentSprite.set_texture(sprite)

#var motion = Vector2()
#func _physics_process(delta):
#	if Input.is_action_pressed("ui_right"):
#		motion.x =500
#		motion.y=0
#		move_and_slide(motion)
#	elif Input.is_action_pressed("ui_left"):
#		motion.x =-500
#		motion.y=0
#		move_and_slide(motion)
#	elif Input.is_action_pressed("ui_up"):
#		motion.y =-500
#		motion.x =0
#		move_and_slide(motion)
#	elif Input.is_action_pressed("ui_down"):
#		motion.y =500
#		motion.x=0
#		move_and_slide(motion)

func getTypePlane():
	return plane.typePlane

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
