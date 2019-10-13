extends TextureButton

func _ready():
    pass

#0 => 
func _on_TextureButton_pressed(buttonPressed):   
	if buttonPressed==0:
		get_tree().change_scene("res://MainScene.tscn")
	else:
		get_tree().change_scene("res://DocScene.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
