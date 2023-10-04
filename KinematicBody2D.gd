extends KinematicBody2D

var motion = Vector2()
var velocidad = 175

var vidas = []
func _ready():
	vidas.append(get_node("../Vida"))
	vidas.append(get_node("../Vida2"))
	vidas.append(get_node("../Vida3"))
	
	vidas[1].queue_free()
	

func _physics_process(delta):
	
	motion = Vector2(0,0)
	
	if Input.is_action_pressed("ui_right"):
		motion.x=velocidad
		
	if Input.is_action_pressed("ui_left"):
		motion.x=-velocidad
		
	if Input.is_action_pressed("ui_up"):
		motion.y=-velocidad
		
	if Input.is_action_pressed("ui_down"):
		motion.y=velocidad
		
	move_and_slide(motion, Vector2(0,0))
	
	for index in get_slide_count():
			var collision = get_slide_collision(index)
			print_debug(collision)
	
func _on_Area2D_body_entered(body):
	print_debug("Colision")
