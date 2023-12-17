extends CharacterBody3D

var start: bool = false
var speed = Vector3(0, 0, -2.5)
var gravity =-9.8

enum States {
	idle,
	MOVING_NORTH,
	MOVING_EAST,
	MOVING_SOUTH,
	MOVING_WEST,
}
var state: States

func _ready():
	velocity = Vector3(0, 0, 0)
	Globals.change_direction.connect(_set_state)


func _process(_delta):
	get_velocity_from_state()


func _physics_process(delta):
	move_and_collide(velocity*delta)


func _set_state(direction: String):
	if direction == "North":
		state = States.MOVING_NORTH
	elif direction == "East":
		state = States.MOVING_EAST
	elif direction == "South":
		state = States.MOVING_SOUTH
	elif direction == "West":
		state = States.MOVING_WEST


func get_velocity_from_state():
	if state == States.MOVING_NORTH:
		velocity = Vector3(0, 0, -2.5)
	elif state == States.MOVING_EAST:
		velocity = Vector3(2.5, 0, 0)
	elif state == States.MOVING_SOUTH:
		velocity = Vector3(0, 0, 2.5)
	elif state == States.MOVING_WEST:
		velocity = Vector3(-2.5, 0, 0)
	else:
		velocity = Vector3(0, 0, 0)
