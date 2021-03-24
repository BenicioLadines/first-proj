extends RigidBody2D

var dir = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 550:
		queue_free()
