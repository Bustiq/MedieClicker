extends Node




func _on_spanish_pressed() -> void:
	TranslationServer.set_locale("es")
	$LanguageSelection.hide()
	$Tutorial.show()
	$"../Control".show()


func _on_english_pressed() -> void:
	TranslationServer.set_locale("en")
	$LanguageSelection.hide()
	$Tutorial.show()
	$"../Control".show()
