extends Node2D

export (String, FILE, "*.tscn") var Next_Scene: String

func _on_Button_pressed()->void:
	Event.emit_signal("ChangeScene", Next_Scene)
