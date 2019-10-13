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
		#sAnim.play(situation.situationAnimation)
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
		var boolean = false 
		var x =0
		while (boolean == false):
			if (buttons[0]['button'].button_up()==true):
				x=buttons[0]['danger'] 
				boolean=true
			if (buttons[1]['button'].button_up()==true):
				x=buttons[1]['danger'] 
				boolean=true
			if (buttons[2]['button'].button_up()==true):
				x=buttons[2]['danger'] 
				boolean=true
			if (buttons[3]['button'].button_up()==true):
				x=buttons[3]['danger'] 
				boolean=true
		if (danger==x):
			pass
			 #sAnim.play(situation.actionAnimation[0])
			#animacion victoria
		else:
			pass
			#animacionderrota
			 #sAnim.play(situation.actionAnimation[1])
			
#Idea: hacer un megaswitch, cada uno perteneciente a una action de la situation, en casa switch se
#llama  a la funcion que analiza el resultado a partir de action+tipoPlane.
#Si por ejemplo hay 30 situations deberia haber un switch de 120 casos uno para cada animacion de accion+plane.
#La animacion de la situacion deberia ir justo antes de estas dos por tanto iria por separado ya que
#que es independiente de ambas. En el Json usaremos el nombre de la action para guardar ahí las
#llaves del switch(o cualquier estructura mas eficiente(diccionario)).

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
