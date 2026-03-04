extends CharacterBody2D

@export var speed = 50.0 # Tốc độ di chuyển
@onready var _animated_sprite = $AnimatedSprite2D

func _ready():
	# Bắt đầu chuỗi hành động
	_animated_sprite.play("up")
	# Kết nối tín hiệu kết thúc animation
	_animated_sprite.animation_finished.connect(_on_animation_finished)

func _physics_process(_delta):
	# Dựa vào tên animation đang chạy để quyết định hướng di chuyển
	match _animated_sprite.animation:
		"up":
			velocity = Vector2.UP * speed
		"down":
			velocity = Vector2.DOWN * speed
		"idle":
			velocity = Vector2.ZERO
	
	# Thực hiện di chuyển thực tế trên map
	move_and_slide()

func _on_animation_finished():
	# Logic chuyển đổi vòng lặp
	if _animated_sprite.animation == "up":
		_animated_sprite.play("down")
	elif _animated_sprite.animation == "down":
		_animated_sprite.play("idle")
	elif _animated_sprite.animation == "idle":
		_animated_sprite.play("up")
