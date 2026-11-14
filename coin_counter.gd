extends Node

signal changed(count: int)

var count := 0


func add() -> void:
	count += 1
	changed.emit(count)


func reset() -> void:
	count = 0
	changed.emit(count)
