extends Node

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@onready var drink_menu: Control = $"../Drink Menu/Control"
@onready var phone_call: TextEdit = $"../Phone Call/Phone Call"
@onready var phone_call_timing: int
@onready var rng = RandomNumberGenerator.new()

func _ready() -> void:
	phone_call_timing = rng.randi_range(timer.wait_time - 15, timer.wait_time)
	timer.timeout.connect(_on_timeout)
	print(phone_call_timing)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "%02d:%02d" % _time_left()
	

func _time_left():
	var time_left = timer.time_left
	
	if phone_call_timing == floori(time_left):
		phone_call.show()
	elif phone_call_timing - 5 == floori(time_left):
		phone_call.hide()
		if timer.time_left < 30:
			phone_call_timing = 20
		else:
			phone_call_timing = rng.randi_range(timer.time_left - 15, timer.time_left)
		print(phone_call_timing)
		
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]

func _on_timeout() -> void:
	drink_menu.show()
