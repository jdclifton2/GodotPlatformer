tool #allows warning to appear in editor
extends Area2D

export var next_scene : PackedScene

onready var anim_player := $AnimationPlayer

func _get_configuration_warning() -> String:
    return "Next scene property can't be empty" if not next_scene else ""


func teleport() -> void:
    anim_player.play("fade_in")    
    yield(anim_player, "animation_finished") #waits for some node to emit a signal before function continues
    get_tree().change_scene_to(next_scene)
