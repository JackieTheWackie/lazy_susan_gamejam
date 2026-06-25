extends CanvasLayer

@onready var intro_1: Control = $Intro1
@onready var intro_2: Control = $Intro2
@onready var intro_3: Control = $Intro3
@onready var intro_4: Control = $Intro4
@onready var intro_5: Control = $Intro5

@onready var start: Button = $Start

func _ready() -> void:
	intro_1.visible = true
	intro_2.visible = false
	intro_3.visible = false
	intro_4.visible = false
	intro_5.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if intro_1.visible == true:
			intro_1.visible = false
			intro_2.visible = true
		elif intro_2.visible == true:
			intro_2.visible = false
			intro_3.visible = true
		elif intro_3.visible == true:
			intro_3.visible = false
			intro_4.visible = true
		elif intro_4.visible == true:
			intro_4.visible = false
			intro_5.visible = true
