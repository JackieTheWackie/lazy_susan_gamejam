extends Control

@onready var yes_button: Button = $PanelContainer/VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	yes_button.pressed.connect(_on_yes_pressed)
	
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
	close_menu()
