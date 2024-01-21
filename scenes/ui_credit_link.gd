extends HBoxContainer

@onready var label: Label = $Label
@onready var link: LinkButton = $Link

@export var person: String
@export var url: String

func _ready():
	label.text = person
	link.text = url
	link.uri = url