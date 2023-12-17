extends StaticBody3D

func set_width(width: int):
	$CollisionShape3D.shape.size.x = width+2
	$CollisionShape3D/MeshInstance3D.mesh.size.x = width+2
