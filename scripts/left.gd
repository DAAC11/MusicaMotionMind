extends Area2D

var Colbien = false
var ColExcelente = false
var ColPerfecto = false
var colision_objeto: Node2D = null  # Almacena el objeto en colisión
signal left_score
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	control()

func control():
	if Input.is_action_just_pressed("ui_left") and !Colbien and !ColExcelente and !ColPerfecto:
		GameManager.combo =0
		$AnimationPlayer.play("error")
		left_score.emit()
		
	elif Input.is_action_just_pressed("ui_left") and ColPerfecto:
		GameManager.combo +=1
		GameManager.perfecto +=1
		GameManager.aciertos +=1
		$AnimationPlayer.play("perfecto")
		destruir_objeto()
		left_score.emit()
		
	elif Input.is_action_just_pressed("ui_left") and ColExcelente:
		GameManager.combo +=1
		GameManager.excelente +=1
		GameManager.aciertos +=1
		$AnimationPlayer.play("excelente")
		destruir_objeto()
		left_score.emit()
		
	elif Input.is_action_just_pressed("ui_left") and Colbien:
		GameManager.combo +=1
		GameManager.bien +=1
		GameManager.aciertos +=1
		$AnimationPlayer.play("bien")
		destruir_objeto()
		left_score.emit()

func destruir_objeto():
	if colision_objeto:
		colision_objeto.queue_free()  # Destruye el objeto en colisión
		colision_objeto = null  # Resetea la referencia
		$Click1.play()

# Señales

func _on_body_entered(body: Node2D) -> void:
	Colbien = true
	colision_objeto = body

func _on_body_exited(body: Node2D) -> void:
	Colbien = false
	colision_objeto = null

func _on_area_2d_excelente_body_entered(body: Node2D) -> void:
	ColExcelente = true
	colision_objeto = body

func _on_area_2d_excelente_body_exited(body: Node2D) -> void:
	ColExcelente = false
	colision_objeto = null

func _on_area_2d_perfecto_body_entered(body: Node2D) -> void:
	ColPerfecto = true
	colision_objeto = body

func _on_area_2d_perfecto_body_exited(body: Node2D) -> void:
	ColPerfecto = false
	colision_objeto = null
