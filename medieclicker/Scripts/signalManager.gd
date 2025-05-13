extends Node

signal on_medie_clicked()
signal on_purchase(purchase_cost)
signal on_building_purchased(building : ScoreType.type)
signal on_medie_gain(earnings : float)
signal on_medie_loss(earnings : float)
signal on_medies_changed(medieCount : float)
signal on_upgrade_unlocked(upgrade : Upgrade)
signal on_upgrade_purchased(upgrade : Upgrade)
signal on_upgrade_hovered(upgrade : Upgrade)
signal on_upgrade_unhovered()
