class_name MovementLogic

const MAX_SPEED := 300.0
const ACCELERATION := 1200.0
const FRICTION := 80.0


static func horizontal_velocity(current: float, direction: float, delta: float) -> float:
	if direction:
		return move_toward(current, direction * MAX_SPEED, ACCELERATION * delta)
	return move_toward(current, 0.0, FRICTION * delta)
