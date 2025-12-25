extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var can_climb = false
var is_climbing = false
var pause_gravity = false

@onready var my_area_shape : Area2D = get_node("Area2D")

func _physics_process(delta: float) -> void:
	
	
	
	
	# Add the gravity.
	if not is_on_floor() and not pause_gravity:
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY



		#Checks routinely if the player is overlapping with any collectibles or 
	#similar interactables
	if my_area_shape.has_overlapping_areas():
		var my_area_list = my_area_shape.get_overlapping_areas()
		for area in my_area_list:
			print(area.get_groups())
			if area.is_in_group("Climable"):
				can_climb = true
			if not area.is_in_group("Climable"):
				can_climb = false
				is_climbing = false
				
			print(can_climb)
	else:
		can_climb = false
		is_climbing = false
		pause_gravity = false
			
			
				
			
				
				
				
		#print(my_area_list)
	
		#TODO: RECHECK VALUE AND DEBUG
	#print(can_climb)
	if can_climb and Input.is_action_pressed("move_up"):
		velocity.y = (JUMP_VELOCITY/2)
		is_climbing = true
		pause_gravity = true
		
	if can_climb and Input.is_action_pressed("move_down"):
		velocity.y = -(JUMP_VELOCITY/2)
		is_climbing = true
		pause_gravity = true
		
	if can_climb and is_climbing and Input.is_action_just_released("move_up"):
		velocity.y = 0
		
	if can_climb and is_climbing and Input.is_action_just_released("move_down"):
		velocity.y = 0
		
		
	


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
	

		
	#Reset states I suppose
	#can_climb = false
	#is_climbing = false
	
	
