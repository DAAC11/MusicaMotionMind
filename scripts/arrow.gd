extends RigidBody2D

var fuerza_constante = Vector2(0, 1000)  # Cambia 500 según la velocidad que quieras

func _ready() -> void:
	Vector2(0, 1000)
func _physics_process(delta):
	apply_central_force(fuerza_constante)

func press():
	$AnimationPlayer.play("press")
