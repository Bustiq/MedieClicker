extends Control

var clicks := 0
var pin_count := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_medie_clicked.connect(on_medie_click)
	SignalManager.on_producer_purchased.connect(on_producer_purchase)
	SignalManager.on_upgrade_hovered.connect(on_upgrade_hover)

func on_medie_click():
	clicks += 1
	if clicks >= 10:
		$"1".hide()
		$"2".show()
		$"../../Control/Producers".show()
		SignalManager.on_medie_clicked.disconnect(on_medie_click)

func on_producer_purchase(scoreType : ScoreType.type):
	if scoreType == ScoreType.type.BULDING_1:
		pin_count += 1
		if pin_count == 1:
			$"2".hide()
			$"3".show()
		if pin_count == 3:
			$"3".hide()
			$"4".show()
			$"../../Control/Store".show()
			SignalManager.on_producer_purchased.disconnect(on_producer_purchase)

func on_upgrade_hover(u : UpgradeResource):
	$"4/FinishTutorial".show()

func _on_finish_tutorial_pressed() -> void:
	hide()
