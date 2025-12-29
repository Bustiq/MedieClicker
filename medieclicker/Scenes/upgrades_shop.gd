extends GridContainer

var current_page : int = 1
const MAX_UPGRADES_PER_PAGE = 8
var upgrades : Array[UpgradeResource]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_upgrade_unlocked.connect(add_upgrade_to_shop)
	SignalManager.on_upgrade_purchased.connect(remove_upgrade_from_shop)

const upgrade_scene = "res://Scenes/upgrade.tscn"

func add_upgrade_to_shop(upgrade : UpgradeResource):
	var instance = load(upgrade_scene).instantiate()
	instance.set_upgrade(upgrade)
	instance.change_color_if_buyable(MedieManager.get_medies())
	add_child(instance)
	show_current_page()

func remove_upgrade_from_shop(upgrade : UpgradeResource):
	for child in get_children():
		if child.get_upgrade() == upgrade:
			remove_child(child)
			child.queue_free()
			
			if current_page - 1 == get_max_pages():
				current_page -= 1
			
			
			show_current_page()
			return

func show_current_page():
	hide_all_upgrades()
	for i in range(MAX_UPGRADES_PER_PAGE):
		var upgrade = get_child(MAX_UPGRADES_PER_PAGE * (current_page - 1) + i)
		if upgrade:
			upgrade.show()
	update_arrows_visivility()
	show_current_page_index()

func show_current_page_index():
	if get_max_pages() == 1:
		$"../PageNumber".hide()
	else:
		$"../PageNumber".show()
		$"../PageNumber".text = str(current_page) + "/" + str(get_max_pages())

func hide_all_upgrades():
	for child in get_children():
		child.hide()




func _on_page_down_pressed() -> void:
	if current_page > 1:
		current_page -= 1
		show_current_page()


func _on_page_up_pressed() -> void:
	if current_page < get_max_pages():
		current_page += 1
		show_current_page()


func update_arrows_visivility():
	print(current_page)
	if current_page == 1:
		$"../Page_Down".hide()
	else:
		$"../Page_Down".show()
	if current_page == get_max_pages():
		$"../Page_Up".hide()
	else:
		$"../Page_Up".show()



func get_max_pages() -> int:
	return max(ceil(float(get_child_count()) / MAX_UPGRADES_PER_PAGE), 1)
