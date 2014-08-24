DIMEN = 35

class window.PedestalTrigger extends Trigger
	constructor: (@id, x, y, @levelWindow, @assetQueue, @bitmapLayer) ->
		super x, y, DIMEN, DIMEN
		
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
	
	onTick: (e, data) ->
		super e, data
		player = data.player
		trigger = data.trigger
		
		if @isTriggered
			player.setNearbyPedestal trigger
		else
			player.removeNearbyPedestal trigger