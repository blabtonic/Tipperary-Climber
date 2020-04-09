extends KinematicBody2D

var motion = Vector2()

var speed = 2 * 60

func _physics_process(delta):
	#Gravity
	motion.y += 10
	
	# Player Movement
	if Input.is_action_pressed('ui_right'):
		motion.x = 100
	elif Input.is_action_pressed('ui_left'):
		motion.x = -100
	else:
		motion.x = 0
	
	move_and_slide(motion)
