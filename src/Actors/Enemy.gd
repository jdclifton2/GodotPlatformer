extends "res://src/Actors/Actor.gd"


func _ready() -> void:
	set_physics_process(false) #deactivate enemy at the start of the game
	_velocity.x = -speed.x # go to the left at the speed of x


func _on_StompDetector_body_entered(body: Node) -> void:
	var body_is_higher = body.global_position.y < get_node("StompDetector").global_position.y
	
	if body_is_higher:
		#print("body position: " + str(body.global_position.y))
		get_node("CollisionShape2D").set_deferred("disabled", true)
		queue_free()


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0 #go the other direction
	_velocity.y = 	move_and_slide(_velocity, FLOOR_NORMAL).y


