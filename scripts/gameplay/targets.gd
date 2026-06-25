extends Node2D

@onready var target_1: AnimatedSprite2D = $"Target 1"
@onready var target_2: AnimatedSprite2D = $"Target 2"
@onready var target_3: AnimatedSprite2D = $"Target 3"
@onready var timer: Timer = $"../Timer/Timer"

#@onready var rand_animation = ["Laughing", "Neutral", "Talking"].pick_random()

func _ready() -> void:
	target_1.play("Neutral")
	target_2.play("Neutral")
	target_3.play("Neutral")
	await get_tree().create_timer(randi_range(1,3)).timeout
	pose()

func pose() -> void:
	while timer.time_left > 0:
		var rand_animation = ["Laughing", "Neutral", "Talking"].pick_random()
		await get_tree().create_timer(randi_range(1,3)).timeout
		print("new pose")
		target_1.play(rand_animation)
		target_2.play(rand_animation)
		target_3.play(rand_animation)
