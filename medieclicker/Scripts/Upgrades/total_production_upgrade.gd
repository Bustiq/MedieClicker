extends Upgrade

var required_medies : float


func unlock_condition():
	return MedieManager.total_medie_count > required_medies or NumberHelper.equals( MedieManager.total_medie_count, required_medies)
