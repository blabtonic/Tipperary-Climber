extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 30
const SPEED = 120
const JUMP_HEIGHT = -600

var motion = Vector2()


func _physics_process(delta):
	#Gravity
	motion.y += 10
	
	# Player Movement
	if Input.is_action_pressed('ui_right'):
		motion.x = 100
		$Sprite.flip_h = false
	elif Input.is_action_pressed('ui_left'):
		motion.x = -100
		$Sprite.flip_h = true
	else:
		motion.x = 0
	# Jump added
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = -300
	
	motion = move_and_slide(motion, UP)
