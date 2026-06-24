extends Node

var actual_drink: int = 0
var actual_target: int = 0
var drink_correct: bool = false
var target_correct: bool = false
var selected_drink: int = 0
var selected_target: int = 0
var decision_time: bool = false
var drink_list = [$"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer/1", $"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer/2", $"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer/3", $"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer/4",
				  $"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer2/5", $"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer2/6", $"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer2/7", $"Drink Menu/Control/PanelContainer/VBoxContainer/HBoxContainer2/8"]

func _ready() -> void:
	actual_drink = randi_range(1,8)
	actual_target = randi_range(1,3)
