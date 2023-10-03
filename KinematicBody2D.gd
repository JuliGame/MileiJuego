extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	
	motion = Vector2(0,0)
	
	if Input.is_action_pressed("ui_right"):
		motion.x=125
		
	if Input.is_action_pressed("ui_left"):
		motion.x=-125
		
	if Input.is_action_pressed("ui_up"):
		motion.y=-125
		
	if Input.is_action_pressed("ui_down"):
		motion.y=125
		
	move_and_slide(motion, Vector2(0,0))
	
	for index in get_slide_count():
			var collision = get_slide_collision(index)
			print_debug(collision)
	
func _on_Area2D_body_entered(body):
	print_debug("Colision")
