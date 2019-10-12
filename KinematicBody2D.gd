extends KinematicBody2D

var motion = Vector2()
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x =500
		motion.y=0
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_left"):
		motion.x =-500
		motion.y=0
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_up"):
		motion.y =-500
		motion.x =0
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_down"):
		motion.y =500
		motion.x=0
		move_and_slide(motion)