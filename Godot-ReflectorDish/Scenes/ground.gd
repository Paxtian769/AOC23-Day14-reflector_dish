extends StaticBody3D

func set_size_and_position(width: float, length: int):
	var ground_size = Vector3(width+2, 1, length+6)
	$CollisionShape3D.shape.size = ground_size
	$MeshInstance3D.mesh.size = ground_size
	position = Vector3(width/2, 0, length/2-1)
