extends RigidBody2D
var reset : bool = false

var audio_1 : AudioStreamPlayer2D
var audio_2 : AudioStreamPlayer2D


var Player_1_hit_sound = preload("res://Sounds/315725__nabz871__tonal-impact-e.wav")
var Player_2_hit_sound = preload("res://Sounds/315726__nabz871__tonal-impact-d.wav")
var Default_Collision_sound = preload("res://Sounds/319940__nabz871__electro-snare-1.wav")
var Goal = preload("res://Sounds/315724__nabz871__tonal-impact-f.wav")
var Respawn = preload("res://Sounds/277046__nabz871__electro-flanged-snare (1).wav")

var Glow : Sprite2D

var Spawn_Location = Vector2()
var max_Speed = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	audio_1 = get_node("Audio_1")
	audio_2 = get_node("Audio_2")
	Glow = get_node("Sprite2D/Glow")
	Spawn_Location = position
	pass # Replace with function body.
func _physics_process(_delta):
	if linear_velocity.x > max_Speed:
		linear_velocity.x = max_Speed
	if linear_velocity.y > max_Speed:
		linear_velocity.y = max_Speed
		
	if Glow.modulate.a > 0.1: 
		Glow.modulate.a -= 0.1
	
	if Input.is_key_pressed(KEY_0):
		reset = true
	pass

func _integrate_forces(state):
	if reset:
		state.transform = Transform2D(0, Spawn_Location)
		state.linear_velocity = Vector2()
		state.angular_velocity = 0
		reset = false


func _on_Scene_Reset_Ball():
	reset = true
	audio_2.stream = Respawn
	audio_2.play()
	pass # Replace with function body.


func _on_Puck_body_entered(body):
	
	Glow.modulate.a = 1
	
	if body.is_in_group("Player_1"):
		audio_1.stream = Player_1_hit_sound
		audio_1.play()
	elif body.is_in_group("Player_2"):
		audio_1.stream = Player_2_hit_sound
		audio_1.play()
	else:
		audio_2.stream = Default_Collision_sound
		audio_2.play()
	pass # Replace with function body.


func _on_Scene_Goal_Sound():
	audio_2.stream = Goal
	audio_2.play()
	pass # Replace with function body.
