extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	fillData()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func checkData():
	var output = "Por favor completar: "
	var control = false
	if %Nombre.text =="" and %Codigo.text =="":
		output += "Codigo y Nombre" 
	elif %Nombre.text =="":
		output += "Nombre"
	elif %Codigo.text =="":
		output += "Codigo"
	else:
		GameManager.codigo = %Codigo.text
		GameManager.nombre = %Nombre.text
		control  = true
	%warning.text = output
	return control
	
func fillData():
	if GameManager.datos:
		%Codigo.text= GameManager.codigo
		%Nombre.text= GameManager.nombre

func resetStats():
	GameManager.nivel_seleccionado = 0
	GameManager.combo = 0
	GameManager.bien = 0
	GameManager.excelente = 0
	GameManager.perfecto = 0
	GameManager.reinicios = 0
	GameManager.aciertos = 0
	
	
func _on_button_level_1_pressed() -> void:
	if checkData():
		resetStats()
		GameManager.nivel_seleccionado = 1
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	pass # Replace with function body.


func _on_button_level_2_pressed() -> void:
	if checkData():
		resetStats()
		GameManager.nivel_seleccionado = 2
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	pass # Replace with function body.


func _on_button_level_3_pressed() -> void:
	if checkData():
		resetStats()
		GameManager.nivel_seleccionado = 3
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	pass # Replace with function body.
