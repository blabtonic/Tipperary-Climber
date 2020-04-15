extends Camera2D

export (int) var SCROLL_SPEED

# Makes camera scroll automatically
func _process(delta):
	position.y -= delta * SCROLL_SPEED
