extends CharacterBody2D

const SPEED := 300.0
var dir := Vector2(0, 0)

func _ready() -> void:
	velocity = dir * SPEED

func _physics_process(_delta: float) -> void:
	var col = move_and_collide(velocity)
	if col:
		if is_in_group("Bricks"):
			pass
