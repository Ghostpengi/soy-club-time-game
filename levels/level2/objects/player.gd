extends Node2D
var jump_impulse = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Replace with function body.
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Gravity
	if jump_impulse > 0:
		jump_impulse -= 1;
	self.global_position.y += 8-jump_impulse;
	#Move player checks or something
	if Input.is_action_pressed("move_right"):
		self.global_position.x += 8;
	if Input.is_action_pressed("move_left"):
		self.global_position.x -= 8;
	if Input.is_action_pressed("move_up"):
		jump_impulse = 20;
		
		
	
	
	
