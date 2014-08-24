DIMEN = 35

class window.PedestalTrigger
	constructor: (@id, @x, @y, @levelWindow, @assetQueue, @bitmapLayer) ->
		@orbColor = null
		@linkedPedestal = null
		@linkedDoors = []
	
	setLinkedPedestal: (@linkedPedestal) ->
	
	setLinkedDoors: (@linkedDoors) ->
	
	setOrbColor: (@orbColor) ->
		@addOrbBitmap()
		
		for door in @linkedDoors
			door.toggleState() if door.color == @orbColor
	
	addOrbBitmap: ->
		asset = switch @orbColor
			when Color.RED then @assetQueue.getResult "redOrb"
			when Color.GREEN then @assetQueue.getResult "greenOrb"
			when Color.BLUE then @assetQueue.getResult "blueOrb"
		
		@orbBitmap = new createjs.Bitmap asset
		@orbBitmap.x = @x - DIMEN/2
		@orbBitmap.y = @y - DIMEN/2
		@bitmapLayer.addChild @orbBitmap
	
	removeOrb: ->
		for door in @linkedDoors
			door.toggleState() if door.color == @orbColor
		
		@orbColor = null
		@bitmapLayer.removeChild @orbBitmap
	
	watchPlayer: (player) ->
		createjs.Ticker.on "tick", @onTick, null, false, {player: player, trigger: this}
	
	unwatchPlayer: ->
		createjs.Ticker.off "tick", @onTick
	
	onTick: (e, data) ->
		player = data.player
		trigger = data.trigger
		
		playerLeft = player.x + 2
		playerRight = player.x + Player.WIDTH - 2
		playerTop = player.y
		playerBottom = player.y + Player.HEIGHT
		
		triggerLeft = trigger.x - DIMEN/2
		triggerRight = trigger.x + DIMEN/2
		triggerTop = trigger.y - DIMEN/2
		triggerBottom = trigger.y + DIMEN/2
		
		if ((playerLeft > triggerLeft and playerLeft < triggerRight) or (playerRight > triggerLeft and playerRight < triggerRight)) and
		((playerBottom > triggerTop and playerBottom < triggerBottom) or (playerTop > triggerTop and playerTop < triggerBottom))
			player.setNearbyPedestal trigger
		else
			player.removeNearbyPedestal trigger