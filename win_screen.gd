extends CanvasLayer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()

func show_win() -> void:
	$ColorRect/Label.text = "YOU WIN\nCoins: %d\nPress R to restart" % CoinCounter.count 
	show()
	get_tree().paused = true

func _input(event: InputEvent) -> void:
	if visible and event is InputEventKey:
		if event.pressed and event.keycode == KEY_R:
			get_tree().paused = false
			get_tree().reload_current_scene()
