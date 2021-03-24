extends KinematicBody2D

var projectile = load("res://prefabs/projectile.tscn")
var cannonReady = false
var vec_start = Vector2.ZERO
var vec_finish = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var line = $Line2D
onready var shootSpawn = $Position2D

# Called when the node enters the scene tree for the first time.
func _ready():
	line.hide()
#	pass # Replace with function body.

func _physics_process(delta):
	
	if cannonReady == false:
		position.x += (get_global_mouse_position().x - position.x)/6
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		cannonReady = true
		line.show()
		vec_start = get_global_mouse_position()
		vec_finish = vec_start
	if Input.is_action_pressed("click"):
		vec_finish = get_global_mouse_position()
		line.points[1] = vec_start - vec_finish
	if Input.is_action_just_released("click"):
		line.hide()
		shoot()
		cannonReady = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func shoot():
	var p = projectile.instance()
	owner.add_child(p)
	p.transform = shootSpawn.global_transform
	p.apply_central_impulse((vec_start - vec_finish) * 5)
	
