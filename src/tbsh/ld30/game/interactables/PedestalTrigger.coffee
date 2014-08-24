DIMEN = 35

class window.PedestalTrigger extends Trigger
	constructor: (@id, x, y, @levelWindow, @assetQueue, @bitmapLayer, @hintLayer) ->
		super x, y, DIMEN, DIMEN, DIMEN/2, DIMEN/2
		
		@orbColor = null
		@linkedPedestal = null
		@linkedDoors = []
		
		@xPlace = new createjs.Bitmap @assetQueue.getResult "xPlace"
		@xPlace.alpha = 0
		@xPlace.x = x - 75
		@xPlace.y = y - 25
		@xPickup = new createjs.Bitmap @assetQueue.getResult "xPickup"
		@xPickup.alpha = 0
		@xPickup.x = x - 75
		@xPickup.y = y - 25
		@zPlace = new createjs.Bitmap  @assetQueue.getResult "zPlace"
		@zPlace.alpha = 0
		@zPlace.x = x - 75
		@zPlace.y = y - 25
		@zPickup = new createjs.Bitmap @assetQueue.getResult "zPickup"
		@zPickup.alpha = 0
		@zPickup.x = x - 75
		@zPickup.y = y - 25
		
		@hintLayer.addChild @xPlace
		@hintLayer.addChild @xPickup
		@hintLayer.addChild @zPlace
		@hintLayer.addChild @zPickup
	
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
		
		@orbBitmap = new Orb asset
		@orbBitmap.x = @x
		@orbBitmap.y = @y
		@orbBitmap.regX = DIMEN/2
		@orbBitmap.regY = DIMEN/2
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
		hintAsset = null
		
		if player.constructor.name is "TopDimensionPlayer"
			placeAsset = trigger.zPlace
			pickupAsset = trigger.zPickup
		else
			placeAsset = trigger.xPlace
			pickupAsset = trigger.xPickup
		
		unless trigger.orbColor is null
			if player.orbColor is null
				hintAsset = pickupAsset
				otherAsset = placeAsset
			else
				trigger.xPlace.alpha = 0
				trigger.xPickup.alpha = 0
				trigger.zPlace.alpha = 0
				trigger.zPickup.alpha = 0
		else
			unless player.orbColor is null
				hintAsset = placeAsset
				otherAsset = pickupAsset
			else
				trigger.xPlace.alpha = 0
				trigger.xPickup.alpha = 0
				trigger.zPlace.alpha = 0
				trigger.zPickup.alpha = 0
		
		if trigger.isTriggered
			player.setNearbyPedestal trigger
			
			unless hintAsset is null
				hintAsset.alpha = 1
				otherAsset.alpha = 0
		else
			player.removeNearbyPedestal trigger
			trigger.xPlace.alpha = 0
			trigger.xPickup.alpha = 0
			trigger.zPlace.alpha = 0
			trigger.zPickup.alpha = 0