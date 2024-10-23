extends Control

var save_path = "user://variable.save"


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
	
	label.text = "nuggets: " + str(Global.nuggets)
	
	cool_animation.texture = imagelist[count]
	if count == 4:
		count = 0
		Global.nuggets +=ammountNuggets
		
		progress_bar.value+=0.5
	else:
		count+= 1
		
		if progress_bar.value == 100:
			progress_bar.value -=100
			Global.autoNugget += (Global.autoNugget*.2)
			ammountNuggets += (ammountNuggets*.5)
		
		
		

func _on_upgrade_1_pressed() -> void:
	if Global.nuggets >= 5:
		ammountNuggets +=1
		Global.nuggets-=5
		label.text = "nuggets: " + str(Global.nuggets)
		
		



func _on_upgrade_2_pressed() -> void:
	if Global.nuggets >= 50:
		ammountNuggets +=5
		Global.nuggets-=50
		label.text = "nuggets: " + str(Global.nuggets)
		


		
	




func _on_upgrade_3_pressed() -> void:
	if Global.nuggets >= 100:
		ammountNuggets +=10
		Global.nuggets-=100
		label.text = "nuggets: " + str(Global.nuggets)

func _on_timer_timeout() -> void:
	Global.nuggets += Global.autoNugget
	label.text = "nuggets: " + str(Global.nuggets)

func _on_upgrade_4_pressed() -> void:
	if Global.nuggets >= 150:
		Global.autoNugget += 1
		Global.nuggets  -= 150
		label.text = "nuggets: " + str(Global.nuggets)


func _on_upgrade_5_pressed() -> void:
	if Global.nuggets >= 300:
		Global.autoNugget += 5
		Global.nuggets -= 300
		label.text = "nuggets: " + str(Global.nuggets)
	

	


func _on_upgrade_6_pressed() -> void:
	if Global.nuggets >= 600:
		Global.autoNugget += 15
		Global.nuggets -= 600
		label.text = "nuggets: " + str(Global.nuggets)
		 


func _on_upgrade_7_pressed() -> void:
	if Global.nuggets >=1250:
		Global.autoNugget +=20
		ammountNuggets +=50
		Global.nuggets -=1250
		label.text = "nuggets: " + str(Global.nuggets)
		
	
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.nuggets)
	file.store_var(ammountNuggets)
	file.store_var(	Global.autoNugget)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global.nuggets = file.get_var(Global.nuggets)
		ammountNuggets = file.get_var(ammountNuggets)
		Global.autoNugget = file.get_var(	Global.autoNugget)
	else:
		print("no data saved...")
		Global.nuggets = 0
		ammountNuggets = 0
		Global.autoNugget = 0






func _on_save_pressed() -> void:
	save()


func _on_load_pressed() -> void:
	load_data()




func _on_load_2_pressed() -> void:
	get_tree().change_scene_to_file("res://pt_2.tscn")
