extends Node

var player_1_score = 0
var player_2_score = 0
var max_score = 5  # Set your max score here

# Reference to the label node
var score_label

func _ready():
	# Get the label node
	score_label = get_node("UI/Label")
	# Initialize the label text
	update_score_label()

# Update score for player 1
func player_1_scored():
	player_1_score += 1
	update_score_label()
	check_game_over()
	print("Player 1 Score: ", player_1_score)

# Update score for player 2
func player_2_scored():
	player_2_score += 1
	update_score_label()
	check_game_over()
	print("Player 2 Score: ", player_2_score)

# Check if the game is over
func check_game_over():
	if player_1_score >= max_score:
		print("Player 1 wins!")
		reset_game()
	elif player_2_score >= max_score:
		print("Player 2 wins!")
		reset_game()

# Reset the game
func reset_game():
	player_1_score = 0
	player_2_score = 0
	update_score_label()

# Update the score label
func update_score_label():
	score_label.text = "Player 1: " + str(player_1_score) + " - Player 2: " + str(player_2_score)
