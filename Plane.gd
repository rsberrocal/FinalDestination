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
	plane = getRandomPlane()

	planeAnimator.play("initAnimation")

	setSprite()

	
func getRandomPlane():
	return planes[OS.get_datetime()['second'] % 2 ]

func actualPlane():
	return plane

func getSpriteText():
	var listSprites = ["res://assets/Img/Avioneta-B.png","res://assets/Img/Avioneta-N.png"
	,"res://assets/Img/Militar-B.png","res://assets/Img/Militar-N.png",
	"res://assets/Img/Pasajeros-B.png","res://assets/Img/Pasajeros-N.png",
	"res://assets/Img/Privado-B.png","res://assets/Img/Privado-N.png"]
	var index = 0 if OS.get_datetime()['second'] % 2  else 1
	if plane['typePlane'] == 1:
		var typeSpriteA = ["res://assets/Img/Avioneta-B.png","res://assets/Img/Avioneta-N.png"]
		return typeSpriteA[index]
	if plane['typePlane'] == 2:
		var typeSpriteB = ["res://assets/Img/Militar-B.png","res://assets/Img/Militar-N.png"]
		return typeSpriteB[index]
	if plane['typePlane'] == 3:
		var typeSpriteC = ["res://assets/Img/Pasajeros-B.png","res://assets/Img/Pasajeros-B.png"]
		return typeSpriteC[index]
	if plane['typePlane'] == 4:
		var typeSpriteD = ["res://assets/Img/Privado-B.png","res://assets/Img/Privado-N.png"]		
		return typeSpriteD[index]

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
