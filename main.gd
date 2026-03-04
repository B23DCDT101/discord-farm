extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_door_to_house_body_entered(body: Node2D) -> void:
	# Kiểm tra xem có đúng là Player bước vào không
	if body.name == "CharacterBody2D": 
		# Chuyển sang scene bên trong nhà (hãy tạo file này trước)
		Global.player_spawn_position = Vector2(100, 200) # Tọa độ cửa ở phòng mới
		get_tree().change_scene_to_file("res://scene/inside_house.tscn")
