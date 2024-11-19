extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_data()
	get_tree().paused = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_data():
	%TituloFin.text = "Felicitaciones  "+GameManager.nombre
	%Nivel.text = "Nivel : " +str(GameManager.nivel_seleccionado)
	%Aciertos.text ="Aciertos : " + str(GameManager.aciertos)
	%Buenas.text = "Buenas : "+str(GameManager.bien)
	%Exelentes.text ="Excelentes : "+ str(GameManager.excelente)
	%Perfectas.text = "Perfectas : "+str(GameManager.perfecto)
	%MayorCombo.text = "Mayor combo: "+str(GameManager.mayorCombo)

func resetStats():
	GameManager.combo = 0
	GameManager.bien = 0
	GameManager.excelente = 0
	GameManager.perfecto = 0
	GameManager.reinicios = 0
	GameManager.aciertos = 0


func _on_salir_pressed() -> void:
	resetStats()
	GameManager.reinicios = 0
	GameManager.datos = true
	get_tree().change_scene_to_file("res://scenes/inicio.tscn")
	pass # Replace with function body.
