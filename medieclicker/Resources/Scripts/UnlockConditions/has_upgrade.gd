extends UnlockCondition
class_name HasUpgrade

@export var required_upgrade : UpgradeResource

func unlock_condition() -> bool:
	return UpgradesManager.has_purchased_upgrade(required_upgrade)

func get_description() -> String:
	return "Compra la mejora \"" + required_upgrade.upgrade_name + "\""
