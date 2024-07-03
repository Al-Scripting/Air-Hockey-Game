extends CharacterBody2D

# Declare member variables here
@export var speed: int = 1000
@export var Control_Style = 1 

var custom_velocity = Vector2()

func Control_Style_1(): 
	if Input.is_action_pressed("ui_right"):
		custom_velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		custom_velocity.x -= speed
		
	if Input.is_action_pressed("ui_up"):
		custom_velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		custom_velocity.y += speed
	pass

func Control_Style_2(): 
	if Input.is_action_pressed("move_right"):
		custom_velocity.x += speed
	if Input.is_action_pressed("move_left"):
		custom_velocity.x -= speed
		
	if Input.is_action_pressed("move_up"):
		custom_velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		custom_velocity.y += speed

func _physics_process(_delta):
	custom_velocity = Vector2.ZERO
	
	if Control_Style == 1:
		Control_Style_1()
	else:
		Control_Style_2()
	
	velocity = custom_velocity
	move_and_slide()

func _ready():
	pass



