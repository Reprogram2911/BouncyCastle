extends Label


func _ready() -> void:
	CoinCounter.changed.connect(_on_changed)
	CoinCounter.reset()


func _on_changed(count: int) -> void:
	text = "Coins: %d" % count
