extends Control

var number =0

@onready var label =$MarginContainer/VBoxContainer/Label
func _on_button_pressed() -> void:
	number +=1
	label.text = str(number)
