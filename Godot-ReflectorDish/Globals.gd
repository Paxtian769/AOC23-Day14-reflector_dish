extends Node

var rows: int=0
var total_weight: int = 0

signal total_weight_changed
signal change_direction


func _ready():
	total_weight = 0


func _set_direction(direction: String):
	change_direction.emit(direction)


func add_to_rows():
	rows += 1


func change_weight(weight: int):
	total_weight += weight
	total_weight_changed.emit(total_weight)
