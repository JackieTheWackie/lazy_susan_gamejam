extends Camera2D

@export var pan_speed: float = 20.0
var target_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_down"):
		target_pos = Vector2(global_position.x, 500)
	
	if Input.is_action_pressed("ui_up"):
		target_pos = Vector2(global_position.x, 0)
		
	global_position = global_position.lerp(target_pos, pan_speed * delta)
	
