extends CharacterBody2D

const SPEED := 300.0
var startdir := 1.0

func _ready() -> void:
	velocity = Vector2(0, startdir * SPEED)

func _physics_process(_delta: float) -> void:
	var move = move_and_slide()
	if move:
		var col = get_last_slide_collision()
		var getnormal = col.get_normal()
		velocity = velocity.bounce(getnormal)
