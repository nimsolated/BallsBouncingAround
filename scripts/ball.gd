class_name Ball extends CharacterBody3D

@onready var ball_mesh_inst: MeshInstance3D = %BallMeshInst
@onready var ball_light: OmniLight3D = %BallLight

@export var color: Color = Color.WHITE
@export_range(0, 64.0, 0.01) var speed: float = 10.0

var xDirection: float = 1.0
var yDirection: float = 1.0
var xAdjust: float = 1.0
var yAdjust: float = 1.0
var rng: RandomNumberGenerator

func _ready() -> void:
	ball_light.light_color = color
	
	var mat = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.emission_enabled = true
	mat.emission = Color.BLACK
	ball_mesh_inst.mesh = SphereMesh.new()
	ball_mesh_inst.mesh.material = mat
	
	rng = RandomNumberGenerator.new()
	rng.randomize()

func _physics_process(delta: float) -> void:
	position.z = 0
	if (is_on_wall()):
		xAdjust = randf_range(0.75, 1.75)
		xDirection = -xDirection
	if (is_on_ceiling() || is_on_floor()):
		yAdjust = randf_range(0.75, 1.75)
		yDirection = -yDirection
	velocity = Vector3(speed * xDirection * xAdjust, speed * yDirection * yAdjust, 0)
	move_and_slide()
