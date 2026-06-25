extends Control

@onready var target_1: TextureButton = $PanelContainer/VBoxContainer/HBoxContainer/target_1
@onready var target_2: TextureButton = $PanelContainer/VBoxContainer/HBoxContainer/target_2
@onready var target_3: TextureButton = $PanelContainer/VBoxContainer/HBoxContainer/target_3

@onready var final_menu: Control = $"../../Final Menu/Control"

func _ready() -> void:
	hide()
	target_1.pressed.connect(target_check.bind(1))
	target_2.pressed.connect(target_check.bind(2))
	target_3.pressed.connect(target_check.bind(3))
	print(GameManager.actual_target)

#Check if the target is correct then go to the final menu
func target_check(target_number: int) -> void:
	if target_number == GameManager.actual_target:
		GameManager.target_correct = true
	else:
		GameManager.target_correct = false
		
	GameManager.selected_target = target_number
	hide()
	final_menu.show()
