extends CharacterBody2D


var was_on_floor := false
var last_impact_speed := 0.0
var wall_speed := 0.0
var window := JumpWindow.new()


func _physics_process(delta: float) -> void:
	window.tick(delta)

	if not is_on_floor():
		velocity += get_gravity() * delta

	var just_pressed := Input.is_action_just_pressed("ui_accept")
	if just_pressed:
		window.press()

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction == 0.0:
		wall_speed = 0.0
	velocity.x = MovementLogic.horizontal_velocity(velocity.x, direction, delta)

	var impact_speed := velocity.y
	var impact_x := velocity.x
	move_and_slide()

	if is_on_wall():
		var wall_normal_x := get_wall_normal().x
		var holding_in := direction * wall_normal_x < 0.0
		var new_x := SurfaceBounce.wall_velocity(impact_x, velocity.x, wall_normal_x, holding_in, wall_speed)
		wall_speed = absf(new_x) if holding_in else 0.0
		velocity.x = new_x

	if is_on_ceiling():
		velocity.y = SurfaceBounce.ceiling_velocity(impact_speed, velocity.y)

	if is_on_floor() and not was_on_floor:
		var boosted := Input.is_action_pressed("ui_accept") or window.pressed_recently()
		velocity.y = BounceLogic.bounce_velocity(impact_speed, boosted, Input.is_action_pressed("ui_down"))
		last_impact_speed = impact_speed
		window.register_landing(boosted)
	elif just_pressed and window.landed_recently():
		velocity.y = BounceLogic.bounce_velocity(last_impact_speed, true, Input.is_action_pressed("ui_down"))
		window.consume()

	was_on_floor = is_on_floor()
