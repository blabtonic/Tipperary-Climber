extends Area2D

onready var collect_animation = $AnimationPlayer 

func _ready():
	$AnimationPlayer.play('Clover_Idle')

func _on_Clover_body_entered(body):
	$CollectSound.play()
	collect_animation.play('fade_out')
