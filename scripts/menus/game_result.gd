
extends Control

@onready var result: Label = $"PanelContainer/VBoxContainer/Result"

func _ready() -> void:
	hide()
	visibility_changed.connect(_on_visibility_changed)

func _on_visibility_changed():
	if(GameManager.drink_correct && GameManager.target_correct):
		result.text = "YOU ARE CORRECT"
	else:
		result.text = "YOU ARE WRONG"
