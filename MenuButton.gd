extends TextureButton

func _ready():
    pass

#0 => 
func _on_TextureButton_pressed(buttonPressed):
    #navigation
	var mainScene = preload("res://MainScene.tscn")
#	get_tree().get_root().add_child(mainScene)	
	if buttonPressed==0:
		get_tree().change_scene("res://MainScene.tscn")
	else:
		print('2344')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
