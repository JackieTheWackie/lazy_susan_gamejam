extends Node

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@onready var drink_menu: Control = $"../Drink Menu/Control"
@onready var phone_call: TextEdit = $"../Phone Call/Phone Call"
@onready var waiter: TextEdit = $"../Waiter/Arm/Waiter"
@onready var slide: AnimationPlayer = $"../Waiter/Arm/Slide"

@onready var hint_timing: int
@onready var phone_hint: bool = true
@onready var rng = RandomNumberGenerator.new()
# How long a hint should show
@onready var hint_length = 5

# Time period in which a hint could occur
@onready var hint_range = 15

# Buffer time between hints
@onready var hint_buffer = 10

@onready var drink_hints = []
@onready var current_drink_hint = 0
@onready var target_hints = []
@onready var current_target_hint = 0
@onready var has_incremented = false

func _ready() -> void:
	hint_timing = rng.randi_range(timer.wait_time - 15, timer.wait_time - 3)
	timer.timeout.connect(_on_timeout)
	for hint in GameManager.drink_hints:
		if (hint.get("number") == GameManager.actual_drink):
			drink_hints = hint.get("hints")
			break

	for hint in GameManager.target_hints:
		if (hint.get("number") == GameManager.actual_target):
			target_hints = hint.get("hints")
			break
	drink_hints.shuffle()
	target_hints.shuffle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !GameManager.decision_time:
		label.text = "%02d:%02d" % _time_left()
	else:
		timer.stop()
		label.hide()
		phone_call.hide()
		waiter.hide()


func _time_left():
	var time_left = timer.time_left
	
	# If it's time for a hint
	if hint_timing == floori(time_left) and current_target_hint <= 2:
		if not has_incremented:
			# Show the hint (alternating between phone and waiter)
			if phone_hint:
				phone_call.text = drink_hints[current_drink_hint]
				current_drink_hint += 1
				has_incremented = true
				phone_call.show()
			else:
				waiter.text = target_hints[current_target_hint]
				current_target_hint += 1
				has_incremented = true
				waiter.show()
				slide.play("slide in")
				
	# After a certain amount of time, hide currently showing hint
	elif hint_timing - hint_length == floori(time_left):
		if phone_hint:
			phone_call.hide()
		else:
			waiter.hide()
		
		# Alternate to other hint type here
		phone_hint = !phone_hint
		
		# If there's only 30 seconds left, show one more hint then cut it off
		if timer.time_left < 30:
			hint_timing = 20
		else:
			hint_timing = rng.randi_range(timer.time_left - hint_range, timer.time_left - hint_buffer)
	else:
		has_incremented = false
	
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]


func _on_timeout() -> void:
	drink_menu.show()
	GameManager.decision_time = true
