class_name BounceLogic

const BOUNCE_DAMPING := 0.9
const JUMP_GROWTH := 1.2
const MIN_BOUNCE_SPEED := 400.0
const MAX_BOUNCE_SPEED := INF
const DOWN_DAMPING := 0.6
const DOWN_MIN_BOUNCE_SPEED := 150.0


static func bounce_velocity(impact_speed: float, boosted: bool, down_held: bool) -> float:
	if down_held:
		return -clampf(impact_speed * DOWN_DAMPING, DOWN_MIN_BOUNCE_SPEED, MAX_BOUNCE_SPEED)

	var factor := JUMP_GROWTH if boosted else BOUNCE_DAMPING
	return -clampf(impact_speed * factor, MIN_BOUNCE_SPEED, MAX_BOUNCE_SPEED)
