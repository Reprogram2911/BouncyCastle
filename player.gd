extends CharacterBody2D


var was_on_floor := false
var last_impact_speed := 0.0
var window := JumpWindow.new()


func _physics_process(delta: float) -> void:
	window.tick(delta)

	if not is_on_floor():
		velocity += get_gravity() * delta

	var just_pressed := Input.is_action_just_pressed("ui_accept")
	if just_pressed:
		window.press()

	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = MovementLogic.horizontal_velocity(velocity.x, direction, delta)

	var impact_speed := velocity.y
	move_and_slide()

	if is_on_floor() and not was_on_floor:
		var boosted := Input.is_action_pressed("ui_accept") or window.pressed_recently()
		velocity.y = BounceLogic.bounce_velocity(impact_speed, boosted, Input.is_action_pressed("ui_down"))
		last_impact_speed = impact_speed
		window.register_landing(boosted)
	elif just_pressed and window.landed_recently():
		velocity.y = BounceLogic.bounce_velocity(last_impact_speed, true, Input.is_action_pressed("ui_down"))
		window.consume()

	was_on_floor = is_on_floor()
