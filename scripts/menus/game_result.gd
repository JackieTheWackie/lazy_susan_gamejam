
extends Control

@onready var result: Label = $"PanelContainer/VBoxContainer/Result"
@onready var endings: AnimatedSprite2D = $PanelContainer/VBoxContainer/endings
@onready var lose_text: Node2D = $"PanelContainer/VBoxContainer/Lose-Text"
@onready var win_text: Node2D = $"PanelContainer/VBoxContainer/Win-Text"
@onready var glass_clink: AudioStreamPlayer2D = $Cheers
@onready var reset_button: Button = $"PanelContainer/VBoxContainer/Reset Button"


func _ready() -> void:
	hide()
	visibility_changed.connect(_on_visibility_changed)
	reset_button.pressed.connect(_on_reset_pressed)
	lose_text.visible = false
	win_text.visible = false

func _on_visibility_changed():
	glass_clink.play()
	if(GameManager.drink_correct && GameManager.target_correct):
		result.text = "Success"
		endings.play("Win")
		win_text.visible = true
	else:
		result.text = "Failure"
		endings.play("Lose")
		lose_text.visible = true

func _on_reset_pressed():
	GameManager.actual_drink = randi_range(1,8)
	GameManager.actual_target = randi_range(1,3)
	get_tree().reload_current_scene()
