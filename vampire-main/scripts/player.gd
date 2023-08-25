extends CharacterBody2D
#PLAYER IS IN A GROUP CALLED "player"
@export var max_speed := 100
@export var acceleration := 1500
@export var friction := 1200

@onready var axis = Vector2.ZERO


func _process(delta):
	look_at(get_global_mouse_position())

	
func _physics_process(delta):
	move(delta)





func get_input_axis():
	axis = Input.get_vector("left", "right", "up", "down")
	return axis
	
	
	
	
	
func move(delta):
	
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(friction * delta)
		
	else:
		apply_movement(axis * acceleration * delta)
		
	move_and_slide()
	
	
	
	
	
	
func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
		
	else:
		velocity = Vector2.ZERO
		
		
		
		
		
func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(max_speed)
