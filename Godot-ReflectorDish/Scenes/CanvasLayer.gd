extends CanvasLayer

@onready var label = $Label

signal set_direction

func _ready():
	Globals.total_weight_changed.connect(_on_weight_changed)
	set_direction.connect(Globals._set_direction)
	$NorthButton.pressed.connect(_on_north_button_pressed)
	$EastButton.pressed.connect(_on_east_button_pressed)
	$WestButton.pressed.connect(_on_west_button_pressed)
	$SouthButton.pressed.connect(_on_south_button_pressed)

func _on_weight_changed(weight: int):
	label.text = "Total weight: " + str(weight)


func _on_north_button_pressed():
	set_direction.emit("North")


func _on_east_button_pressed():
	set_direction.emit("East")


func _on_south_button_pressed():
	set_direction.emit("South")


func _on_west_button_pressed():
	set_direction.emit("West")
