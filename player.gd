extends Node3D

const MIN_ZOOM := 2.0
const MAX_ZOOM := 10.0

@onready var cam: Camera3D = %Camera3D
@onready var body: Node3D = $PlayerBody
@onready var marker: Node3D = $PlayerBody/Marker3D
@onready var gimbal: SpringArm3D = %Gimbal

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
		gimbal.rotation_degrees.x = clampf(gimbal.rotation_degrees.x, -80, 80)

	if event.is_action_pressed("cam_zoom_in"):
		gimbal.spring_length = clampf(gimbal.spring_length - 1, MIN_ZOOM, MAX_ZOOM)

	if event.is_action_pressed("cam_zoom_out"):
		gimbal.spring_length = clampf(gimbal.spring_length + 1, MIN_ZOOM, MAX_ZOOM)




	# # FPS, look around
	# if event is InputEventMouseMotion and Input.is_action_pressed("cam_fps"):
	# 	look_at_player = false


