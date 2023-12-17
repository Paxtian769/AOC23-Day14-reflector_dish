extends Node

var rows: int=0
var total_weight: int = 0

signal total_weight_changed
signal start_simulation


func _ready():
	total_weight = 0


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		start_simulation.emit()
		print(rows)


func add_to_rows():
	rows += 1


func change_weight(weight: int):
	total_weight += weight
	total_weight_changed.emit(total_weight)
