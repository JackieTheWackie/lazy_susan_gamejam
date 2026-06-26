extends Node

@onready var timer: Timer = $Timer
@onready var bottomInstruction: Label = $"Bottom Instruction"
@onready var topInstruction: Label = $"Top Instruction"

func _ready() -> void:
	timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	bottomInstruction.hide()
	topInstruction.hide()
