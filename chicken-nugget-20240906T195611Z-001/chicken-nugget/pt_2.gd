extends Control
@onready var label: Label = $MarginContainer/HBoxContainer/VBoxContainer/Label



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "nuggets: " + str(Global.nuggets)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MAIN.tscn")
	
func _on_timer_timeout() -> void:
	Global.nuggets += Global.autoNugget
	label.text = "nuggets: " + str(Global.nuggets)
