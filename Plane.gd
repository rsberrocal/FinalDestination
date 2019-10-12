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
<<<<<<< HEAD
	planeAnimator.play("initAnimation")
=======
	setSprite()
>>>>>>> f03d7848d3c3dce5f8ebc91ca66b8c771ac2f932
	
func getRandomPlane():
	return planes[randi() % planes.size()]

func actualPlane():
	return plane

func getSpriteText():
	if plane['typePlane'] == 1:
		var typeSpriteA = ["res://assets/Img/Avioneta-B.png","res://assets/Img/Avioneta-N.png"]
		return typeSpriteA[randi() % typeSpriteA.size()]
	if plane['typePlane'] == 2:
		var typeSpriteB = ["res://assets/Img/Militar-B.png","res://assets/Img/Militar-N.png"]
		return typeSpriteB[randi() % typeSpriteB.size()]
	if plane['typePlane'] == 3:
		var typeSpriteC = ["res://assets/Img/Pasajeros-B.png","res://assets/Img/Militar-N.png"]
		return typeSpriteC[randi() % typeSpriteC.size()]
	if plane['typePlane'] == 4:
		var typeSpriteD = ["res://assets/Img/Privado-B.png","res://assets/Img/Privado-N.png"]		
		return typeSpriteD[randi() % typeSpriteD.size()]

func setSprite():
	var textToSprite = getSpriteText()
	var sprite = load(textToSprite)	
	self.set_texture(sprite)

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
