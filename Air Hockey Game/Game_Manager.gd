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
	get_node("Player_1").control_Style = 1
	get_node("Player_2").control_Style = 2  
	Score_Board = get_node("ui/Score_Board")
	Score_Board.text = Player_1_Score as String + "-" + Player_2_Score as String 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_1_Goalpost_body_entered(body):
	Player_2_Score += 1
	emit_signal("Goal_Sound")
	print("Player 2 Score : " + Player_2_Score as String)
	yield(get_tree().create_timer(3.0), "timeout")
	emit_signal("Reset_Ball")
	Score_Board.text = Player_1_Score as String + "-" + Player_2_Score as String 
	pass # Replace with function body.


func _on_Player_2_Goalpost_body_entered(body):
	Player_1_Score += 1
	emit_signal("Goal_Sound")
	print("Player 1 Score : " + Player_1_Score as String)
	yield(get_tree().create_timer(3.0), "timeout")
	emit_signal("Reset_Ball")
	Score_Board.text = Player_1_Score as String + "-" + Player_2_Score as String 
	pass # Replace with function body.

func _check_Points():
	if Player_1_Score >= Point_max :
		Winner_String = "Player_1 Wins!!!"
	if Player_2_Score >= Point_max :
		Winner_String = "Player_2 Wins!!!"
