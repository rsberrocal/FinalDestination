extends KinematicBody2D

# Declare member variables here. Examples
var situations = {}
var actions = {}
var situationsAnim = {}
var actionsAnim = {}
var situation = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://assets/config/situationConfig.json", file.READ)
	var text = file.get_as_text()	
	situations = JSON.parse(text).result
	situations = situations['situations']
	actions = actions['situations']['actions']
	situationsAnim = situationsAnim['situation']['situationAnimation']
	actionsAnim = actionsAnim['situations']['actionsAnimation']
	file.close()
	#To get random
	situation = situations[randi() % situations.size()]	
func getSituation():
	return situation
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
