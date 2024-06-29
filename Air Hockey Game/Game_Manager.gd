extends Node2D

signal Reset_Ball
signal Goal_Sound

var Player_1_Score = 0
var Player_2_Score = 0
var Point_max = 7
var Winner_String : String
var Score_Board : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize player nodes here if necessary
	Score_Board = get_node("ui/Score_Board")
	Score_Board.text = str(Player_1_Score) + "-" + str(Player_2_Score)
	connect("Reset_Ball", Callable(get_node("Puck"), "_on_Reset_Ball"))
	connect("Goal_Sound", Callable(get_node("AudioStreamPlayer"), "_on_Goal_Sound"))

# Called when Player 1's goalpost is triggered
func _on_Player_1_Goalpost_body_entered(_body):
	Player_2_Score += 1
	emit_signal("Goal_Sound")
	print("Player 2 Score : " + str(Player_2_Score))
	await get_tree().create_timer(3.0).timeout
	emit_signal("Reset_Ball")
	Score_Board.text = str(Player_1_Score) + "-" + str(Player_2_Score)
	_check_Points()

# Called when Player 2's goalpost is triggered
func _on_Player_2_Goalpost_body_entered(_body):
	Player_1_Score += 1
	emit_signal("Goal_Sound")
	print("Player 1 Score : " + str(Player_1_Score))
	await get_tree().create_timer(3.0).timeout
	emit_signal("Reset_Ball")
	Score_Board.text = str(Player_1_Score) + "-" + str(Player_2_Score)
	_check_Points()

# Check if any player has reached the maximum points
func _check_Points():
	if Player_1_Score >= Point_max:
		Winner_String = "Player 1 Wins!!!"
		print(Winner_String)
		_end_game()
	elif Player_2_Score >= Point_max:
		Winner_String = "Player 2 Wins!!!"
		print(Winner_String)
		_end_game()

# End the game when a player wins
func _end_game():
	# Implement any logic to handle the end of the game, such as stopping the game or displaying a victory screen.
	pass
