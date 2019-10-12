extends Node2D

var plane
var situation
var isEnd = false 
var actualStatus = {}
func _ready():
	plane = self.get_node("Plane").actualPlane()
	situation = self.get_node("Situations").getActualSituation()
	status()

func status():
	while not isEnd:
		if(plane.has('isDead')):
			#Finish the game
			isEnd = true		
		actualStatus = {
			plane: plane,
			situation: self.get_node("Situations").getActualSituation()
		}
		isEnd = true
	

func _decode(): 
	pass
#Idea: hacer un megaswitch, cada uno perteneciente a una action de la situation, en casa switch se
#llama  a la funcion que analiza el resultado a partir de action+tipoPlane.
#Si por ejemplo hay 30 situations deberia haber un switch de 120 casos uno para cada animacion de accion+plane.
#La animacion de la situacion deberia ir justo antes de estas dos por tanto iria por separado ya que
#que es independiente de ambas. En el Json usaremos el nombre de la action para guardar ahí las
#llaves del switch(o cualquier estructura mas eficiente(diccionario)).

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
