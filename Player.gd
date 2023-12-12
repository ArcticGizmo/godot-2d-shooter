extends CharacterBody2D

const SPEED: int = 300
const BULLET_SPEED: int = 2000
const BULLET_TMP: PackedScene = preload("res://Bullet.tscn")

func _physics_process(delta):
	self.velocity = Input.get_vector("left", "right", "up", "down") * SPEED
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = BULLET_TMP.instantiate()
	bullet.position = $Marker2D.global_position
	bullet.rotation_degrees = self.rotation_degrees
	bullet.apply_impulse(Vector2(BULLET_SPEED, 0).rotated(rotation))
	bullet.add_to_group("projectile")
	owner.add_child(bullet)
	
	
func kill():
	get_tree().reload_current_scene()


#func _on_area_2d_body_entered(body):
#	if "Enemy" in body.name:
#		kill()
