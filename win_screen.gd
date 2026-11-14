extends CanvasLayer

@onready var _label: Label = $Label


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()


func show_win() -> void:
	$ColorRect/Label.text = "YOU WIN\nCoins: %d" % CoinCounter.count
	show()
	get_tree().paused = true
