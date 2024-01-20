extends Node3D

@onready var cam: Camera3D = %Camera3D
@onready var body: Node3D = $PlayerBody
@onready var marker: Node3D = $PlayerBody/Marker3D
@onready var gimbal: Node3D = %Gimbal

var look_at_player: bool = true

# func _ready():
# 	cam.look_at(gimbal.position)

func _process(delta):
	gimbal.position = gimbal.position.move_toward(body.position, delta * gimbal.position.distance_to(body.position))

# 	if look_at_player:
# 		cam.look_at(marker.global_position)


	# if cam.global_position.distance_to(marker.global_position) > 5:
	# 	cam.global_position = cam.global_position.move_toward(marker.global_position, delta * cam.global_position.distance_to(marker.global_position))

func _unhandled_input(event):
	# if event.is_action_pressed("cam_look_at_player"):
	# 	var t := create_tween()
	# 	t.tween_method(cam.look_at.bind(Vector3.UP), cam.rotation, body.position, 1)
		# t.tween_method(cam.look_at, Vector3.ZERO, Vector3(100, 100, 100), 1)
		# look_at_player = !look_at_player


	# orbit
	if event is InputEventMouseMotion and Input.is_action_pressed("cam_orbit"):
		gimbal.rotation.x += -event.relative.y * Auto.mouse_sensitivity
		gimbal.rotation.y += -event.relative.x * Auto.mouse_sensitivity
		gimbal.rotation.x = clampf(gimbal.rotation.x, -deg_to_rad(80), deg_to_rad(80))

	if event.is_action_pressed("cam_zoom_in"):
		print(cam.position.z)
		cam.position.z -= 1
		cam.position.z = clampf(cam.position.z, 2.0, 10.0)
	if event.is_action_pressed("cam_zoom_out"):
		cam.position.z += 1
		cam.position.z = clampf(cam.position.z, 2.0, 10.0)



	# # FPS, look around
	# if event is InputEventMouseMotion and Input.is_action_pressed("cam_fps"):
	# 	look_at_player = false


