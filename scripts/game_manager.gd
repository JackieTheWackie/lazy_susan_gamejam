extends Node

var actual_drink: int = 0
var actual_target: int = 0
var drink_correct: bool = false
var target_correct: bool = false
var selected_drink: int = 0
var selected_target: int = 0

func _ready() -> void:
	actual_drink = randi_range(1,8)
	actual_target = randi_range(1,3)
