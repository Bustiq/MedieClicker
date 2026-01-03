extends UnlockCondition
class_name PongSelfBounces


@export var self_bounce_count : int
# Called when the node enters the scene tree for the first time.

func unlock_condition() -> bool:
	return MedieManager.pong_self_bounce_count >= self_bounce_count

func get_description() -> String:
	return "Rebota la pelota del pong " + str(self_bounce_count) + " veces"
