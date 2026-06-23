extends Node

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@onready var drink_menu: Control = $"../Drink Menu/Control"

func _ready() -> void:
	timer.timeout.connect(_on_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "%02d:%02d" % _time_left()

func _time_left():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]

func _on_timeout() -> void:
	drink_menu.show()
