extends CharacterBody3D

var start: bool = false
var speed = Vector3(0, 0, -2.5)
var gravity =-9.8


func _ready():
	velocity = Vector3(0, 0, 0)
	Globals.start_simulation.connect(_on_start)


func _physics_process(delta):
	if start:
		velocity = speed
	move_and_collide(velocity*delta)


func _on_start():
	start = true
