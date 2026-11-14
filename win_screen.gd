extends CanvasLayer

@onready var _label: Label = $Label


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()


func show_win() -> void:
	_label.text = "You win!\nCoins: %d" % CoinCounter.count
	get_tree().paused = true
	show()
