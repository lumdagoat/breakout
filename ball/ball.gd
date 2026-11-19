extends CharacterBody2D

const SPEED := 400.0
var startdir := 1.0
signal brickbreak

func _ready() -> void:
	velocity = Vector2(0, startdir * SPEED)

func _physics_process(_delta: float) -> void:
	# brick collision, detection, and signal emit
	var collide = move_and_collide(velocity * _delta)
	if collide:
		var getnormal = collide.get_normal()
		velocity = velocity.bounce(getnormal)
		
		var hit_object = collide.get_collider()
		if hit_object.is_in_group("Bricks"):
			hit_object.queue_free()
			brickbreak.emit()
		
