extends Control

var number =0

@onready var label =$MarginContainer/VBoxContainer/Label

@onready var imagelist = [
load("res://art/sprite_0.png"),
load("res://art/sprite_1.png"),
load("res://art/sprite_2.png"),
load("res://art/sprite_3.png"),
load("res://art/sprite_4.png"),
]

@onready var cool_animation: TextureRect = $MarginContainer/VBoxContainer/coolanimation
var count =0
func _on_button_pressed() -> void:
	number +=1
	label.text = str(number)
	
	cool_animation.texture = imagelist[count]
	if count == 4:
		count = 0
	else:
		count+=1
