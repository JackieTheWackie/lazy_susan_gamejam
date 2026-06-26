extends Node2D

@onready var target_1: AnimatedSprite2D = $"Target 1"
@onready var target_2: AnimatedSprite2D = $"Target 2"
@onready var target_3: AnimatedSprite2D = $"Target 3"
@onready var timer: Timer = $"../Timer/Timer"

@onready var rand_animation = ["Laughing", "Neutral", "Talking"]

func _ready() -> void:
	target_1.play("Neutral")
	target_2.play("Neutral")
	target_3.play("Neutral")
	await get_tree().create_timer(randi_range(1,3)).timeout
	pose()

func pose() -> void:
	while timer.time_left > 0:
		
		await get_tree().create_timer(randi_range(5,10)).timeout
		target_1.play(rand_animation.pick_random())
		target_2.play(rand_animation.pick_random())
		target_3.play(rand_animation.pick_random())
