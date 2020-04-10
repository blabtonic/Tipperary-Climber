extends KinematicBody2D

const UP = Vector2(0,-1)
const ACCLELERATION = 60
const GRAVITY = 15
const MAX_SPEED = 120
const JUMP_HEIGHT = -300

var motion = Vector2()


func _physics_process(delta):
	# Gravity
	motion.y += GRAVITY
	
	# Friction
	var friction = false
	
	# Player Movement
	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x+ACCLELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play('Run')
	elif Input.is_action_pressed('ui_left'):
		motion.x = max(motion.x-ACCLELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play('Run')
	else:
		$Sprite.play('Idle')
		friction = true
	
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			$JumpSound.play()
			motion.y = JUMP_HEIGHT
		if friction == true:
			#Linearly interpolates between two values by a normalized value lerp()
			motion.x = lerp(motion.x, 0, 0.2) 
	else:
		if motion.y < 0:
			$Sprite.play('Jump')
		else:
			$Sprite.play('Fall')
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	
	motion = move_and_slide(motion, UP)
