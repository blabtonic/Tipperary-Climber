extends KinematicBody2D

var run_speed = 350
var jump_speed = -500
var gravity = 2000
var velocity = Vector2()

onready var animation = get_node('Sprite')

func _ready():
	#need signal
	pass
