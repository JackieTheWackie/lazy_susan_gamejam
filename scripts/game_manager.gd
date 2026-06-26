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
@onready var drink_hints = [
	{
		"number": 1,
		"hints": ["Glass with a stem", "Flavored Rim", "Decorative Garnish"]
	},
	{
		"number": 2,
		"hints": ["Glass with a stem", "Swirly Liquid", "No Garnish"]
	},
	{
		"number": 3,
		"hints": ["Glass without a stem", "On the rocks", "Garnish"]
	},
	{
		"number": 4,
		"hints": ["Glass without a stem", "On the rocks", "Fizzy Liquid"]
	},
	{
		"number": 5,
		"hints": ["Glass with a stem", "Swirly Liquid", "Fruit Garnish"]
	},
	{
		"number": 6,
		"hints": ["Glass with a stem", "Flavored Rim", "Submerged Fruit"]
	},
	{
		"number": 7,
		"hints": ["Glass without a stem", "Fizzy Liquid", "Fruit Garnish"]
	},
	{
		"number": 8,
		"hints": ["Glass with a stem", "Decorative Garnish", "Submerged Fruit"]
	}
]

@onready var target_hints = [
	{
		"number": 1,
		"hints": ["has curly hair", "is wearing a ring", "is wearing a flower"]
	},
	{
		"number": 2,
		"hints": ["is wearing gloves", "has curly hair", "is wearing a flower"]
	},
	{
		"number": 3,
		"hints": ["is wearing gloves", "is wearing a ring", "needs glasses"]
	}
]
func _ready() -> void:
	actual_drink = randi_range(1,8)
	actual_target = randi_range(1,3)
	
