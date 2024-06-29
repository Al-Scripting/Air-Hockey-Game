extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var control_Style = 1;
var velocity = Vector2()
var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	velocity = Vector2(0,0)
	if control_Style == 1:
		Control_Style_1()
	if control_Style == 2:
		Control_Style_2()
	
	move_and_slide(velocity,Vector2())
	pass

func Control_Style_1():
	if Input.is_key_pressed(KEY_W):
		velocity.y -= speed
	if Input.is_key_pressed(KEY_S):
		velocity.y += speed
	if Input.is_key_pressed(KEY_A):
		velocity.x -= speed
	if Input.is_key_pressed(KEY_D):
		velocity.x += speed
	pass
func Control_Style_2():
	if Input.is_key_pressed(KEY_UP):
		velocity.y -= speed
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += speed
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= speed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += speed
	pass
