tool
extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#we can set the data type as seen here w a colon
var score : int = 0
var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800
var velocity : Vector2 = Vector2()
onready var sprite : Sprite = get_node("p1_stand")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = 0
	
	# movement input
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		sprite.flip_h = true
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		sprite.flip_h = false
		
	#applying velocity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#gravity
	velocity.y += gravity * delta
	
	#jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
