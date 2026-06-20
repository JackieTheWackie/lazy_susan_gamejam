extends Control

@onready var yes_button: Button = $PanelContainer/VBoxContainer/Yes
@onready var no_button: Button = $PanelContainer/VBoxContainer/No
@onready var drink_menu: Control = $"../../Drink Menu/Control"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	yes_button.pressed.connect(_on_yes_pressed)
	no_button.pressed.connect(_on_no_pressed)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if visible:
			close_menu()
		else:
			open_menu()
			

func open_menu() -> void:
	show()
	yes_button.grab_focus()
	
func close_menu() -> void:
	hide()

func _on_yes_pressed() -> void:
	hide()
	drink_menu.show()

func _on_no_pressed() -> void:
	close_menu()
