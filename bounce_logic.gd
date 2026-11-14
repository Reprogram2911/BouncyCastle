class_name BounceLogic

const START_SPEED := 450.0
const BOUNCE_DAMPING := 0.9
const JUMP_GROWTH := 1.2
const MIN_BOUNCE_SPEED := 350.0
const MAX_BOUNCE_SPEED := 1000.0


static func bounce_velocity(impact_speed: float, boosted: bool) -> float:
	var factor := JUMP_GROWTH if boosted else BOUNCE_DAMPING
	return -clampf(impact_speed * factor, MIN_BOUNCE_SPEED, MAX_BOUNCE_SPEED)
