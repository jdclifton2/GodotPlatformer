extends Area2D


onready var anim_player := $AnimationPlayer


func _on_Coin_body_entered(body: Node) -> void:
    anim_player.play("fade_out")
