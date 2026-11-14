extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var was_on_floor := false


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if is_on_floor() and not was_on_floor:
		_on_landed()

	was_on_floor = is_on_floor()


func _on_landed() -> void:
	pass
