class window.RoomTrigger extends Trigger
	constructor: (x, y, @tweenDirection, @unwatchFunction, @watchFunction, @levelWindow, @playerLayer) ->
		super x, y, 8, 80
	
	setLinkedTrigger: (@linkedTrigger) ->
	
	startTransition: ->
		player = @playerLayer
		levelWindow = @levelWindow
		otherPlayer = @linkedTrigger.playerLayer
		watchFunction = @watchFunction
		level = @levelWindow.levelLayer
		
		player.controlsMuted = true
		@unwatchFunction levelWindow
		
		levelLayerTo = level.x
		levelLayerTo += if @tweenDirection is Direction.LEFT then 700 else -700
		
		playerLayerTo = if @tweenDirection is Direction.LEFT then player.x - Player.WIDTH - 20 else player.x + Player.WIDTH + 20
		playerLayerTo += if @tweenDirection is Direction.LEFT then -35 else 35
		
		createjs.Tween.get(level).to({x: levelLayerTo}, 700).call ->
			player.controlsMuted = false
			watchFunction levelWindow
		createjs.Tween.get(player).to({x: playerLayerTo}, 700)
		createjs.Tween.get(otherPlayer).to({x: playerLayerTo}, 700)
	
	onTick: (e, data) ->
		super e, data
		
		data.trigger.isOnGround = data.player.yVelocity == 0