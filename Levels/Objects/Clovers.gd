extends Area2D


func _process(delta):
	if Input.is_action_pressed('ui_right'):
		$AnimationPlayer.play('Clover_Collect')
