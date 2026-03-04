extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.player_spawn_position != Vector2.ZERO:
		$CharacterBody2D.global_position = Global.player_spawn_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
