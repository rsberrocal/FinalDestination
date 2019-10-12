extends Node

var plane
var situation
var isEnd = false 
var actualStatus = []
var buttons = {}
onready var situationAnimator = get_node("situationAnimator")
onready var actionplaneAnimator = get_node("actionPlaneAnimator")
func _ready():
	plane = get_node("../Plane").actualPlane()
	print(plane)
	buttons[0]= {'button': get_node("Button"), 'danger': 0, 'color': "white"}
	buttons[1]= {'button': get_node("Button"), 'danger': 0, 'color': "white"}
	buttons[2]= {'button': get_node("Button"), 'danger': 0, 'color': "white"}
	buttons[3]=	{'button': get_node("Button"), 'danger': 0, 'color': "white"}
	#situation = self.get_node("Situations").getActualSituation()

	

func decode(): 
	var situationTxt = situation.getName()
	var planeType = plane.getPlaneType()
	var actions = []
	decodifier(situationAnimator, actionplaneAnimator, planeType, situation)
			
			
func decodifier(sAnim, aAnim, planeType, situation):
		var danger = situation.situationDanger
		var actions = situation.actions
		buttons[danger]['danger'] = danger
		for i in range(len(buttons)):
			buttons[i]['color'] == actions[i]
			
		
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
