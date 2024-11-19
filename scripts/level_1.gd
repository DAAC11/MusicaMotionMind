extends Node2D

var contador = 0
var comboActual = 0
var conterL1 = 39
var conterL2 = 51
var conterL3 = 95

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	configurarNivel()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
func configurarNivel():
	%Nivel.text = "Nivel " +str(GameManager.nivel_seleccionado)
	if GameManager.nivel_seleccionado ==1:
		$Timer.wait_time = 1
		%Song.stream = preload("res://assets/songs/level1.mp3")
		$Song.play()
	elif GameManager.nivel_seleccionado ==2:
		$Timer.wait_time = 0.6593406593406593
		%Song.stream = preload("res://assets/songs/level2.mp3")
		$Song.play()
	elif GameManager.nivel_seleccionado ==3:
		$Timer.wait_time = 0.54
		%Song.stream = preload("res://assets/songs/level3.mp3")
		$Song.play()
	else:
		$Timer.wait_time = 1
		%Song.stream = preload("res://assets/songs/level1.mp3")
		$Song.play()
	print(str($Timer.wait_time)+"s")

func flecha():
	mayorCombo()
	var flecha_arriba = preload("res://scenes/arrow.tscn")
	var flechas = flecha_arriba.instantiate()
	var dir = randi_range(1,3)
	
	if  dir == 1 :
		flechas.position = $Marker2LEFT.position
		flechas.rotate(deg_to_rad(-90))
		add_child(flechas)
	elif  dir == 2 :
		flechas.position = $Marker2DUP.position
		add_child(flechas)
	elif  dir == 3 :
		flechas.position = $Marker2RIGHT.position
		flechas.rotate(deg_to_rad(90))
		add_child(flechas)
	
	print(dir)

func combo():
	contadores()
	%Aciertos.text = "aciertos: "+str(GameManager.aciertos) 
	if GameManager.combo == 0:
		%AnimationCombos.play("idle_combo")
	elif GameManager.combo > 1:
		%Combos.text = "COMBO x " + str(GameManager.combo)
		%AnimationCombos.play("combo")
		
func contadores():
	%BienScore.text = str(GameManager.bien)
	%ExcelenteScore.text = str(GameManager.excelente)
	%PerfectoScore.text = str(GameManager.perfecto)
	
func resetStats():

	GameManager.combo = 0
	GameManager.bien = 0
	GameManager.excelente = 0
	GameManager.perfecto = 0
	GameManager.reinicios = 0
	GameManager.aciertos = 0
	conterL1 = 39
	conterL2 = 51
	conterL3 = 95

func mayorCombo():
	if GameManager.combo > comboActual:
		comboActual = GameManager.combo
	GameManager.mayorCombo = comboActual
	
		
func generadorFlechas():
	if GameManager.nivel_seleccionado ==1 and conterL1 > 0:
		conterL1 -=1
		contador+=1
		%Contador.text = "Contador : "+ str(contador)
		flecha()
	elif GameManager.nivel_seleccionado ==2 and conterL2 > 0:
		conterL2 -=1
		contador+=1
		%Contador.text = "Contador : "+ str(contador)
		flecha()
	elif GameManager.nivel_seleccionado ==3 and conterL3 > 0:
		conterL3 -=1
		contador += 1
		%Contador.text = "Contador : "+ str(contador)
		flecha()

func createData():
	var data ={
	  "Codigo":str(GameManager.codigo),
	  "Nombre":str(GameManager.nombre),
	  "Nivel":str(GameManager.nivel_seleccionado),
	  "Bien":str(GameManager.bien),
	  "Excelente":str(GameManager.excelente),
	  "Perfecto":str(GameManager.perfecto),
	  "Aciertos":str(GameManager.aciertos),
	  "MayorCombo":str(GameManager.mayorCombo)
	}
	return data
# Canciones
# # short-background-music-for-video-vlog-dance-summer-tropical-house-161963 
	#110 bpm 0.54 seg timer
# # instrumental-background-music-for-short-video-stories-blog-40-seconds-188535
	#91 bpm 0.6593406593406593 seg timer
# # best-background-music-2024no-copyright-music-desi-free-music-199107
	#60 bpm 1 seg timer
func _on_timer_timeout() -> void:
	generadorFlechas()

func _on_area_2d_body_entered(body: Node2D) -> void:
	GameManager.combo =0
	combo()
	body.queue_free()

func _on_right_right_score() -> void:
	combo()

func _on_left_left_score() -> void:
	combo()

func _on_up_up_score() -> void:
	combo()


func _on_reset_pressed() -> void:
	resetStats()
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_home_pressed() -> void:
	resetStats()
	GameManager.reinicios = 0
	GameManager.datos = true
	get_tree().change_scene_to_file("res://scenes/inicio.tscn")
	pass # Replace with function body.


func _on_song_finished() -> void:
	mayorCombo()
	var post = preload("res://scenes/http.tscn")
	var postScene = post.instantiate()
	%Fin.add_child(postScene)
	postScene.send_data(createData())
	var finScene = preload("res://scenes/fin.tscn")
	var win = finScene.instantiate()
	%Fin.add_child(win)
	pass # Replace with function body.
