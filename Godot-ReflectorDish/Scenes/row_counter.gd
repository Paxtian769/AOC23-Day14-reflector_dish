extends Area3D

var row_num: int
var count
@onready var label_3d = $Label3D
@onready var shape = $CollisionShape3D


signal weight_changed


func _ready():
	count = 0
	weight_changed.connect(Globals.change_weight)
	label_3d.text = "Row = " + str(Globals.rows-row_num) + ", Rocks = " + str(count)


func set_row_num(num):
	row_num = num


func set_width(width):
	var size = Vector3(width, 3, 0.6)
	$CollisionShape3D.shape.size = size
	$Label3D.position.x = width/2


func _on_body_entered(_body):
	count += 1
	label_3d.text = "Row = " + str(Globals.rows-row_num) + ", Rocks = " + str(count)
	weight_changed.emit(Globals.rows - row_num)


func _on_body_exited(_body):
	count -= 1
	label_3d.text = "Row = " + str(Globals.rows-row_num) + ", Rocks = " + str(count)
	weight_changed.emit(-(Globals.rows - row_num))
