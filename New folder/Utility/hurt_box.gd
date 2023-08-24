extends Area2D

@export_enum("Cooldown", "HitOnce", "DisableHitBox") var HurtBoxType = 0

@onready var collision = $CollisionShape2d
@onready var disableTimer = $DisableTimer

signal hurt(damage)

func _on_area_entered(area):
	if area.is_in_group("attack"):
		pass
		if not area.get("damage") = null:
			match HurtBoxType:
				0:
					collision.call_deferred("set", "disabled", true)
					disableTime.start()
				1:	#HitOnce
					pass
				2: #DisableHitBox
					if area.has_method("tempdisable"):
						area.tempdisable()
			var damage = area.damage
			emit_signal("hurt",damage)


func _on_disable_timer_timeout():
	collision.call_deferred("set", "disabled", false)
