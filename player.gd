extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -500.0
@export var right=false

# ----------------- NEW LINES START HERE -----------------
const LEVEL_START_X = 50.0  # Min X value (adjust this)
const LEVEL_END_X = 1100.0  # Max X value (adjust this)
# ------------------ NEW LINES END HERE ------------------


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# ----------------- NEW LOGIC START HERE -----------------
	# 1. Clamp the Observer (Amogus) horizontally
	position.x = clamp(position.x, LEVEL_START_X, LEVEL_END_X)
	
	# 2. Since the Quantum State (Babobus) shares the same X position 
	#    in your mirror logic, clamping the Observer fixes Babobus too!
	# ------------------ NEW LOGIC END HERE ------------------


func _on_spike_body_entered(body: Node2D) -> void:
	pass
