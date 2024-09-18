extends Control

var nuggets =0
var ammountNuggets = 1

@onready var label =$MarginContainer/HBoxContainer/VBoxContainer/Label

@onready var imagelist = [
load("res://art/sprite_0.png"),
load("res://art/sprite_1.png"),
load("res://art/sprite_2.png"),
load("res://art/sprite_3.png"),
load("res://art/sprite_4.png"),
]

@onready var cool_animation: TextureRect =$MarginContainer/HBoxContainer/VBoxContainer/Button/coolanimation
var count =1
func _on_button_pressed() -> void:
	
	label.text = str(nuggets)
	
	cool_animation.texture = imagelist[count]
	if count == 4:
		count = 0
		nuggets +=ammountNuggets
		###make nugget progress here with % 
	else:
		count+=1

func _on_upgrade_1_pressed() -> void:
	if nuggets >= 5:
		ammountNuggets +=1
		nuggets-=5
		label.text = str(nuggets)
		
		



func _on_upgrade_2_pressed() -> void:
	if nuggets >= 50:
		ammountNuggets +=5
		nuggets-=50
		label.text = str(nuggets)
		


		
	
	
