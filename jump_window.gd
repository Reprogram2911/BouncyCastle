class_name JumpWindow
extends RefCounted

const BEFORE_LANDING := 0.12
const AFTER_LANDING := 0.1

var _since_press := INF
var _since_landing := INF


func tick(delta: float) -> void:
	_since_press += delta
	_since_landing += delta


func press() -> void:
	_since_press = 0.0


func pressed_recently() -> bool:
	return _since_press <= BEFORE_LANDING


func landed_recently() -> bool:
	return _since_landing <= AFTER_LANDING


func register_landing(boosted: bool) -> void:
	if boosted:
		consume()
	else:
		_since_landing = 0.0


func consume() -> void:
	_since_press = INF
	_since_landing = INF
