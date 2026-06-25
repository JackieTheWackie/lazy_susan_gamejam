extends Control

@onready var actual_drink: Label = $"PanelContainer/VBoxContainer/Actual Drink"
@onready var actual_target: Label = $"PanelContainer/VBoxContainer/Actual Target"
@onready var yes_button: Button = $PanelContainer/VBoxContainer/Yes
@onready var no_button: Button = $PanelContainer/VBoxContainer/No
@onready var drink_menu: Control = $"../../Drink Menu/Control"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	visibility_changed.connect(_on_visibility_changed)
	yes_button.pressed.connect(_on_yes_pressed)
	no_button.pressed.connect(_on_no_pressed)

func _on_visibility_changed():
	actual_drink.text = str(GameManager.selected_drink)
	actual_target.text = str(GameManager.selected_target)

func _on_yes_pressed() -> void:
	if(GameManager.drink_correct && GameManager.target_correct):
		print("YIPPEE")
	else:
		print("YOU STINK")

func _on_no_pressed() -> void:
	hide()
	drink_menu.show()
