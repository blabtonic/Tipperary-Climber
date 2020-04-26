extends Area2D

onready var animation = get_node('Sprite')

func _ready():
	animation.play('QuickTut')
	
	# Adds timer to the node
	var timer = Timer.new()
	self.add_child(timer)
	
	# Connects the timer to queue_free object 
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(5)
	timer.start()
