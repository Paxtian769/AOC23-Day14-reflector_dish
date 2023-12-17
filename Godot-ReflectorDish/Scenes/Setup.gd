extends Node

var moving_rock_scene = preload("res://Scenes/moving_rock.tscn")
var stationary_rock_scene = preload("res://Scenes/stationary_rock.tscn")
var row_counter_scene = preload("res://Scenes/row_counter.tscn")

var input_name = "res://Inputs/input.txt"
@onready var ground = $"../Ground"
@onready var moving_rocks = $"../MovingRocks"
@onready var stationary_rocks = $"../StationaryRocks"
@onready var row_counters = $"../RowCounters"
@onready var camera_3d = $"../Camera3D"


func _ready():
	var input_file = FileAccess.open(input_name, FileAccess.READ)
	var line = input_file.get_line()
	var width = line.length()*1.01
	var rows: int = 0
	while not input_file.eof_reached():
		var row_counter = row_counter_scene.instantiate()
		row_counter.set_width(width)
		row_counter.set_row_num(rows)
		row_counter.position = Vector3(width/2+1, 1, rows)
		row_counters.add_child(row_counter)
		var pos: int = 0
		while pos < line.length():
			if line[pos] == 'O':
				var moving_rock = moving_rock_scene.instantiate()
				moving_rock.position = Vector3((pos+1)*1.01, 1, rows)
				moving_rocks.add_child(moving_rock)
			elif line[pos] == '#':
				var stationary_rock = stationary_rock_scene.instantiate()
				stationary_rock.position = Vector3((pos+1)*1.01, 1, rows);
				stationary_rocks.add_child(stationary_rock)
			pos += 1
		rows += 1
		line = input_file.get_line()
	Globals.rows = rows
	$"../EndShape".set_width(width)
	$"../EndShape".position.x = width/2
	$"../EndShape".position.z = -1
	ground.set_size_and_position(width, rows)
	$"../Camera3D".position.x = width/2+2
	$"../Camera3D".position.y = 25
	$"../Camera3D".position.z = rows+5
	$"../EastBarrier".position.x = width+1
	$"../EastBarrier".position.z = rows/2
	$"../EastBarrier/CollisionShape3D".shape.size.z = rows+2
	$"../WestBarrier".position.x = 0
	$"../WestBarrier".position.z = rows/2
	$"../WestBarrier/CollisionShape3D".shape.size.z = rows+2
	$"../SouthBarrier".position.x = width/2+.5
	$"../SouthBarrier".position.z = rows
	$"../SouthBarrier/CollisionShape3D".shape.size.x = width
