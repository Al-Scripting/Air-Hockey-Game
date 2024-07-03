extends CharacterBody2D

# Set the initial velocity
func _ready():
	set_velocity(Vector2(350, 350))

# Handle physics and collisions
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())

# Handle key inputs
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == Key.KEY_R:
			reset_puck()

# Reset the puck to the middle
func reset_puck():
	global_position = get_viewport_rect().size / 2
	set_velocity(Vector2(350, 350))

# Handle goal collision for player 1
func _on_goal_player_1_body_entered(body):
	if body.name == "Puck":
		get_parent().player_2_scored()
		reset_puck()

# Handle goal collision for player 2
func _on_goal_player_2_body_entered(body):
	if body.name == "Puck":
		get_parent().player_1_scored()
		reset_puck()
