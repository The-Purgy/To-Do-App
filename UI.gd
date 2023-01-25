extends Control


onready var list_item = preload("res://ListItem.tscn")

var level = 1
var xp = 0
onready var max_xp = get_node("MarginContainer/VBoxProgress/ProgressBar").max_value


func _on_AddButton_pressed():
	var list_item_inst = list_item.instance()
	var items_list = $MarginContainer/VBoxContainer/ScrollContainer/ItemList
	var text_input = get_node("MarginContainer/VBoxContainer/TextInput")
	var new_item = text_input.text
	
	items_list.add_child(list_item_inst)
	list_item_inst.get_node("Label").text = new_item
	
	text_input.text = ""


func _on_TextInput_text_entered(new_text):
	_on_AddButton_pressed()

func on_task_done():
	var progress_bar = get_node("MarginContainer/VBoxProgress/ProgressBar")
	var level_label = get_node("MarginContainer/VBoxProgress/Label")
	xp += 1
	if xp >= max_xp:
		level += 1
		level_label.text = "Level " + str(level)
		xp = 0
	progress_bar.set_value(xp)
	
