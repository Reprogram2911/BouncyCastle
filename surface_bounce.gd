class_name SurfaceBounce

const WALL_RESTITUTION := 0.8
const WALL_GROWTH := 1.2
const CEILING_RESTITUTION := 0.8


static func wall_velocity(impact_x: float, current_x: float, wall_normal_x: float, holding_in: bool, remembered_speed: float) -> float:
	var moving_into_wall := impact_x * wall_normal_x < 0.0
	if not moving_into_wall:
		return current_x

	if holding_in:
		var speed := maxf(absf(impact_x), remembered_speed)
		return wall_normal_x * speed * WALL_GROWTH

	return -impact_x * WALL_RESTITUTION


static func ceiling_velocity(impact_y: float, current_y: float) -> float:
	if impact_y >= 0.0:
		return current_y
	return -impact_y * CEILING_RESTITUTION
