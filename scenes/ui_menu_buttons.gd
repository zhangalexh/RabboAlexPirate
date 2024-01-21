extends VBoxContainer


@onready var resume: Button = $ButtonResume
@onready var exit: Button = $ButtonExit

func _ready():
	resume.pressed.connect(AutoInput.menu_toggle)
	exit.pressed.connect(func(): get_tree().quit())
