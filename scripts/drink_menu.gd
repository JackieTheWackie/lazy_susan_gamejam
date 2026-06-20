extends Control

@onready var drink_1: Button = $"PanelContainer/VBoxContainer/HBoxContainer/1"
@onready var drink_2: Button = $"PanelContainer/VBoxContainer/HBoxContainer/2"
@onready var drink_3: Button = $"PanelContainer/VBoxContainer/HBoxContainer/3"
@onready var drink_4: Button = $"PanelContainer/VBoxContainer/HBoxContainer2/4"
@onready var drink_5: Button = $"PanelContainer/VBoxContainer/HBoxContainer2/5"
@onready var drink_6: Button = $"PanelContainer/VBoxContainer/HBoxContainer2/6"
@onready var target_menu: Control = $"../../Target Menu/Control"

func _ready() -> void:
	hide()
	drink_1.pressed.connect(drink_check.bind(1))
	drink_2.pressed.connect(drink_check.bind(2))
	drink_3.pressed.connect(drink_check.bind(3))
	drink_4.pressed.connect(drink_check.bind(4))
	drink_5.pressed.connect(drink_check.bind(5))
	drink_6.pressed.connect(drink_check.bind(6))
	print(GameManager.actual_drink)

#Check if the drink is correct then go to the next menu
func drink_check(drink_number: int) -> void:
	if drink_number == GameManager.actual_drink:
		GameManager.drink_correct = true
	else:
		GameManager.drink_correct = false
	GameManager.selected_drink = drink_number
	hide()
	target_menu.show()
