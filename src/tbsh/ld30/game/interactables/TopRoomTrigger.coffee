class window.TopRoomTrigger extends RoomTrigger
	onTick: (e, data) ->
		super e, data
		
		trigger = data.trigger
		
		if trigger.isTriggered and trigger.linkedTrigger.isTriggered and trigger.isOnGround and trigger.linkedTrigger.isOnGround
			trigger.startTransition()