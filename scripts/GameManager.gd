extends Node

var codigo = ""
var nombre = ""
var datos = false
var nivel_seleccionado = 0
var segundos
var combo =0
var bien = 0
var excelente = 0
var perfecto = 0
var aciertos = 0
var reinicios = 0
var mayorCombo = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	segundos = timer_segs(112)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func timer_segs(bpm):
	return 60/bpm
	
	
