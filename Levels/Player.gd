extends KinematicBody2D

const UP = Vector2(0,-1)
const ACCLELERATION = 60
const GRAVITY = 15
const MAX_SPEED = 85
const JUMP_HEIGHT = -300
const BOUNCER = 6 # need to look into bounce logic

var motion = Vector2()
onready var bounce_raycasts = $BounceRayCast


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
	
	# Jumping Physics
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			$JumpSound.play()
			motion.y = JUMP_HEIGHT
		if friction == true:
			#Linearly interpolates between two values by a normalized value lerp()
			motion.x = lerp(motion.x, 0, 0.2) 
			_check_bounce(delta)
	else:
		if motion.y < 0:
			$Sprite.play('Jump')
		else:
			$Sprite.play('Fall')
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	
	motion = move_and_slide(motion, UP)

func _check_bounce(delta):
	if motion.y > 0:
		for raycast in bounce_raycasts.get_children():
			raycast.cast_to = Vector2.DOWN * motion * delta + Vector2.DOWN
			raycast.force_raycast_update()
			if raycast.is_colliding() && raycast.get_collision_normal() == Vector2.UP:
				motion.y = (raycast.get_collision_point() - raycast.global_position - 
				Vector2.DOWN).y / delta * BOUNCER
				raycast.get_collider().entity.call_deferred('bouncing', self)
				break
