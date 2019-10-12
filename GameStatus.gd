extends Node

var plane
var situation
var isEnd = false 
var actualStatus = []
var buttons = []
onready var situationAnimator = get_node("situationAnimator")
onready var actionplaneAnimator = get_node("actionPlaneAnimator")
func _ready():
	plane = get_node("../Plane").actualPlane()
	
	buttons = [
		{'button': get_node("Btn0"), 'danger': 0, 'color': "white"},
		{'button': get_node("Btn1"), 'danger': 0, 'color': "white"},
		{'button': get_node("Btn2"), 'danger': 0, 'color': "white"},
		{'button': get_node("Btn3"), 'danger': 0, 'color': "white"}
	]
	situation = self.get_node("../Situations")
	situation = situation.getRandomSituation()
	print('holi')
	decode()

func decode(): 	
	var planeType = plane['typePlane']
	var actions = []
	decodifier(situationAnimator, actionplaneAnimator, planeType, situation)
			
			
func decodifier(sAnim, aAnim, planeType, situation):		
		var danger = situation['situationDanger']
		var actions = situation['actions']
		
		for i in range(len(buttons)):
			buttons[i]['danger'] = i
			buttons[i]['color'] = actions[i]
		for i in range(len(buttons)):
			print(buttons)
			if buttons[i]['color']=="red":
				var texture1 = 'res://assets/Img/red.jpg'
				var sprite1 = load(texture1)
				buttons[i]['button'].set_normal_texture(sprite1)
			if buttons[i]['color']=="blue":
				var texture2 = 'res://assets/Img/blue.jpg'
				var sprite2 = load(texture2)
				buttons[i]['button'].set_normal_texture(sprite2)
			if buttons[i]['color']=="green":
				var texture3 = 'res://assets/Img/green.jpg'
				var sprite3 = load(texture3)
				buttons[i]['button'].set_normal_texture(sprite3)
			if buttons[i]['color']=="yellow":
				var texture4 = 'res://assets/Img/yellow.jpg'
				var sprite4 = load(texture4)
				buttons[i]['button'].set_normal_texture(sprite4)
		
		
		
#		sAnim.play(situation.situationAnimation)
#		var inputAnimation = input...
#		aAnim.play(situation.actionAnimation)
#		if (inputAnimation == danger):
#			#youwin
#
#
#		else:
#			#youlose
#			pass
#
#Idea: hacer un megaswitch, cada uno perteneciente a una action de la situation, en casa switch se
#llama  a la funcion que analiza el resultado a partir de action+tipoPlane.
#Si por ejemplo hay 30 situations deberia haber un switch de 120 casos uno para cada animacion de accion+plane.
#La animacion de la situacion deberia ir justo antes de estas dos por tanto iria por separado ya que
#que es independiente de ambas. En el Json usaremos el nombre de la action para guardar ahí las
#llaves del switch(o cualquier estructura mas eficiente(diccionario)).

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
