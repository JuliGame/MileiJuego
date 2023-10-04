extends KinematicBody2D

var motion = Vector2()
var velocidad = 5
	

func _physics_process(delta):
	
	motion = Vector2(0,0)
	motion.y=velocidad
	
	if (position.y > 300):
		queue_free()
		
	var collision = move_and_collide(motion)
	if collision != null:
		var collider = collision.get_collider() 
		if collider is TileMap: # Verificar si el colisionador es un TileMap
			# Cancelar la colisión, para traspasarlo
			var tileMap = collider as TileMap
			var tile_size = tileMap.get_cell_size()
			var half_tile_size = tile_size * 2
			var new_position = position  # Copiar la posición actual del personaje
			new_position.y += half_tile_size.y  # Mover ligeramente hacia arriba para evitar la colisión
			position = new_position  # Actualizar la posición del personaje
