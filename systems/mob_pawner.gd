class_name MobSpawner
extends Node2D

@onready var path_follow_2d: PathFollow2D = %PathFollow2D
@export var creatures: Array[PackedScene]
@export var mobs_per_minute: float = 60
var cooldown: float = 0.0

func _process(delta: float):
	if GameManager.is_game_over: return; 
	cooldown -= delta
	if cooldown > 0: return
	
	var interval = 60.0/mobs_per_minute
	cooldown = interval
	
	var point = get_point()
	var result: Array
	var world_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = point
	parameters.collision_mask = 0b1000
	result = world_state.intersect_point(parameters, 1)
	if !result.is_empty(): return
	
	var creature_scene: PackedScene = creatures.pick_random()
	var creature: Enemy = creature_scene.instantiate()
	var position = point
	creature.global_position = position
	
	get_parent().add_child(creature)
	print('creature spawned at position ', creature.global_position.x, ", ", creature.global_position.y)

func get_point() -> Vector2:
	path_follow_2d.progress_ratio = randf()
	return path_follow_2d.global_position
