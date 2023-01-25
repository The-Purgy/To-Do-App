extends HBoxContainer



func _on_DoneButton_pressed():
	var root = get_node("/root/UI")
	if root.has_method("on_task_done"):
		root.on_task_done()
	queue_free()
