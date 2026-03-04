extends CharacterBody2D

@export var speed = 150
@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	# 1. Nhận input từ bàn phím
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# 2. Xử lý di chuyển
	velocity = direction * speed
	move_and_slide()

	# 3. Xử lý Animation
	if direction != Vector2.ZERO:
		sprite.play("walk") # Tên animation bạn đặt ở Bước 2
		
		# Lật nhân vật sang trái/phải dựa trên hướng đi
		if direction.x > 0:
			sprite.flip_h = true
		elif direction.x < 0:
			sprite.flip_h = false
	else:
		sprite.play("idle")
