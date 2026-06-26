extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var last_frame = sprite.sprite_frames.get_frame_count("default") - 1
@onready var susan: AudioStreamPlayer2D = $susan


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		susan.play()
		if(sprite.frame == last_frame):
			sprite.frame = 0
		else:
			sprite.frame += 1
			
	if event.is_action_pressed("ui_left"):
		susan.play()
		if(sprite.frame == 0):
			sprite.frame = last_frame
		else:
			sprite.frame -= 1
