extends Node

@onready var menu = preload('res://scenes/ui_menu.tscn')
@onready var menuNode: Control = menu.instantiate()
var screen_quad: MeshInstance3D

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	menuNode.hide()
	add_child(menuNode)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		menu_toggle()

func menu_toggle():
	menuNode.visible = not menuNode.visible
	get_tree().paused = not get_tree().paused
	screen_quad.mesh.material.set_shader_parameter('paused', not screen_quad.mesh.material.get_shader_parameter('paused'))