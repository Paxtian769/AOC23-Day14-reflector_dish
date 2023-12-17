extends CanvasLayer

@onready var label = $Label


func _ready():
	Globals.total_weight_changed.connect(_on_weight_changed)


func _on_weight_changed(weight: int):
	label.text = "Total weight: " + str(weight)
