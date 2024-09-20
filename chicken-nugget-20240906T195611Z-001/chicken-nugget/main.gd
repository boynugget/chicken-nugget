extends Control

var tickDuration
var autoNugget =0
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
@onready var progress_bar: ProgressBar = $MarginContainer/HBoxContainer/VBoxContainer2/ProgressBar

@onready var cool_animation: TextureRect =$MarginContainer/HBoxContainer/VBoxContainer/Button/coolanimation
var count =1
func _on_button_pressed() -> void:
	
	label.text = str(nuggets)
	
	cool_animation.texture = imagelist[count]
	if count == 4:
		count = 0
		nuggets +=ammountNuggets
		
		progress_bar.value+=0.5
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
		


		
	
	


func _on_upgrade_3_pressed() -> void:
	if nuggets >= 100:
		ammountNuggets +=10
		nuggets-=100
		label.text = str(nuggets)


func _on_upgrade_4_pressed() -> void:
	if nuggets >= 1000:
		ammountNuggets +=100
		nuggets =-1000
		label.text = str(nuggets)


func _on_upgrade_5_pressed() -> void:
	pass # Replace with function body.
