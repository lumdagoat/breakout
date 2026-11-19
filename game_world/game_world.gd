extends Node
var brickscore := 0
@onready var ScoreLabel = $HUD/ScoreLabel
@onready var MaxBricks = [$BrickLevel1.brickcount]
@onready var WinLabel = $HUD/WinLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	brickscore = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func _on_ball_brickbreak() -> void:
	brickscore += 1
	update_brickscoretext()
	if brickscore == MaxBricks[0]:
		get_node("BrickLevel1").queue_free()
		WinLabel.show()


func _on_brick_clear_pressed() -> void:
	brickscore = MaxBricks[0] - 1
	print(MaxBricks)
	update_brickscoretext()
	
func update_brickscoretext():
		var brickscoretext = str(brickscore)
		ScoreLabel.text = brickscoretext
