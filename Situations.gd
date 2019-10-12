extends KinematicBody2D

# Declare member variables here. Examples
var actions ={}


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://assets/config/situationConfig.json", file.READ)
	var text = file.get_as_text()	
	actions = JSON.parse(text).result
	actions = actions['actions']
	file.close()
	#To get random
	var action = actions[randi() % actions.size()]	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
