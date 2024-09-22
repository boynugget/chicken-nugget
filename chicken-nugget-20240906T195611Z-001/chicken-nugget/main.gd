extends Control

var save_path = "user://variable.save"
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
	
	label.text = "nuggets: " + str(nuggets)
	
	cool_animation.texture = imagelist[count]
	if count == 4:
		count = 0
		nuggets +=ammountNuggets
		
		progress_bar.value+=0.5
	else:
		count+= 1
		
		if progress_bar.value == 100:
			progress_bar.value -=100
			autoNugget += 5
			ammountNuggets +=15
		
		
		

func _on_upgrade_1_pressed() -> void:
	if nuggets >= 5:
		ammountNuggets +=1
		nuggets-=5
		label.text = "nuggets: " + str(nuggets)
		
		



func _on_upgrade_2_pressed() -> void:
	if nuggets >= 50:
		ammountNuggets +=5
		nuggets-=50
		label.text = "nuggets: " + str(nuggets)
		


		
	




func _on_upgrade_3_pressed() -> void:
	if nuggets >= 100:
		ammountNuggets +=10
		nuggets-=100
		label.text = "nuggets: " + str(nuggets)

func _on_timer_timeout() -> void:
	nuggets += autoNugget
	label.text = "nuggets: " + str(nuggets)

func _on_upgrade_4_pressed() -> void:
	if nuggets >= 150:
		autoNugget += 1
		nuggets  -= 150
		label.text = "nuggets: " + str(nuggets)


func _on_upgrade_5_pressed() -> void:
	if nuggets >= 300:
		autoNugget += 5
		nuggets -= 300
		label.text = "nuggets: " + str(nuggets)
	

	


func _on_upgrade_6_pressed() -> void:
	if nuggets >= 600:
		autoNugget += 15
		nuggets -= 600
		label.text = "nuggets: " + str(nuggets)
		 


func _on_upgrade_7_pressed() -> void:
	if nuggets >=1250:
		autoNugget +=20
		ammountNuggets +=50
		nuggets -=1250
		label.text = "nuggets: " + str(nuggets)
		
	
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(nuggets)
	file.store_var(ammountNuggets)
	file.store_var(autoNugget)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		nuggets = file.get_var(nuggets)
		ammountNuggets = file.get_var(ammountNuggets)
		autoNugget = file.get_var(autoNugget)
	else:
		print("no data saved...")
		nuggets = 0
		ammountNuggets = 0
		autoNugget = 0






func _on_save_pressed() -> void:
	save()


func _on_load_pressed() -> void:
	load_data()
