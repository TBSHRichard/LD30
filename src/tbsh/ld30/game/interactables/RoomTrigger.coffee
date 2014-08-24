class window.RoomTrigger extends Trigger
	constructor: (x, y, @tweenDirection, @unwatchFunction, @levelWindow, @playerLayer) ->
		super x, y, 8, 80
	
	setLinkedTrigger: (@linkedTrigger) ->
	
	startTransition: ->
		player = @playerLayer
		otherPlayer = @linkedTrigger.playerLayer
		level = @levelWindow.levelLayer
		player.controlsMuted = true
		@unwatchFunction @levelWindow
		
		levelLayerTo = level.x
		levelLayerTo += if @tweenDirection is Direction.LEFT then 700 else -700
		
		playerLayerTo = player.x + 2 * (Player.WIDTH+10)
		#playerLayerTo += if @tweenDirection is Direction.LEFT then 70 else -70
		
		createjs.Tween.get(level).to({x: levelLayerTo}, 700).call ->
			player.controlsMuted = false
		createjs.Tween.get(player).to({x: playerLayerTo}, 700)
		createjs.Tween.get(otherPlayer).to({x: playerLayerTo}, 700)
	
	onTick: (e, data) ->
		super e, data
		
		data.trigger.isOnGround = data.player.yVelocity == 0