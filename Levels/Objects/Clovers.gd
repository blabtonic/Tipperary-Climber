extends Area2D

onready var collect_animation = $AnimationPlayer

func _on_Clover_body_entered(body):
	collect_animation.play('fade_out')
