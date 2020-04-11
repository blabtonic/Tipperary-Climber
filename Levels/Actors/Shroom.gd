extends KinematicBody2D


var run_speed = 350
var jump_speed = -500
var gravity = 2000
var velocity = Vector2()

onready var animation = get_node('Sprite')

func _ready():
	#need signal
	get_node('Sprite').connect('body_enter', self, '_enter')

func _enter(body):
	if !animation.is_playing():
		animation.play('Bounce')
		
		if body.has_method('bump'):
			body.bump()
