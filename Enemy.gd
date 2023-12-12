extends CharacterBody2D

@onready var PLAYER: CharacterBody2D = get_parent().get_node("Player")

const MOTION = Vector2()

func _physics_process(delta):
	position += (PLAYER.position - position) / 50
	look_at(PLAYER.global_position)
	
	move_and_collide(MOTION)


func _on_area_2d_body_entered(body):
	if body is RigidBody2D and body.is_in_group("projectile"):
		self.queue_free()
		
