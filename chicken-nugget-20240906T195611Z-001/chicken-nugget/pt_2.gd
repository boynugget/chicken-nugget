extends Control
@onready var label: Label = $MarginContainer/HBoxContainer/VBoxContainer/Label

var save_path = "user://variable.save"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.isdisabled == true:
		button_2.disabled = true
		animation_player.play("fry anim")
	label.text = "nuggets: " + str(Global.nuggets)
	if Global.isdisabled2 == true:
		button_3.disabled = true
		animation_player_2.play("burger anim")
		label.text = "nugets: " + str(Global.nuggets)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MAIN.tscn")
	
func _on_timer_timeout() -> void:
	Global.nuggets += Global.autoNugget
	label.text = "nuggets: " + str(Global.nuggets)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.nuggets += 40
	animation_player.play("fry anim")
	label.text = "nuggets: " + str(Global.nuggets)
	

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_button_2_pressed() -> void:
	if Global.nuggets >= 1000:
		animation_player.play("fry anim")
		Global.nuggets-= 1000
		label.text = "nuggets: " + str(Global.nuggets)
		button_2.disabled = true
		Global.isdisabled = true
	
@onready var button_2: Button = $MarginContainer/HBoxContainer/VBoxContainer/Button2


@onready var button_3: Button = $MarginContainer/HBoxContainer/VBoxContainer/Button3
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

	


func _on_button_3_pressed() -> void:
	if Global.nuggets >= 1500:
		animation_player_2.play("burger anim")
		Global.nuggets -= 1500
		label.text = "nuggets: " + str(Global.nuggets)
		button_3.disabled = true
		Global.isdisabled2 = true


func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	Global.nuggets += 80
	animation_player_2.play("burger anim")
	label.text = "nuggets: " + str(Global.nuggets)
