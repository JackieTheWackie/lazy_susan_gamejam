
extends Control

@onready var result: Label = $"PanelContainer/VBoxContainer/Result"
@onready var endings: AnimatedSprite2D = $PanelContainer/VBoxContainer/endings
@onready var lose_text: Node2D = $"PanelContainer/VBoxContainer/Lose-Text"
@onready var win_text: Node2D = $"PanelContainer/VBoxContainer/Win-Text"


func _ready() -> void:
	hide()
	visibility_changed.connect(_on_visibility_changed)
	lose_text.visible = false
	win_text.visible = false

func _on_visibility_changed():
	if(GameManager.drink_correct && GameManager.target_correct):
		result.text = "YOU ARE CORRECT"
		endings.play("Win")
		win_text.visible = true
	else:
		result.text = "YOU ARE WRONG"
		endings.play("Lose")
		lose_text.visible = true
