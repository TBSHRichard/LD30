DECEL = 4
JUMP_VELOCITY = -33
MAX_Y_VELOCITY = 15
X_VELOCITY = 10
JUMP_KEY = 38
MOVE_LEFT_KEY = 37
MOVE_RIGHT_KEY = 39

class window.Player extends createjs.Container
	@WIDTH = 35
	@HEIGHT = 60
	constructor: (@levelWindow, @collisionMap, @assetQueue, @spriteSheet, @interactionKey) ->
		@orbColor = null
		@nearbyPedestal = null
		@xVelocity = 0
		@yVelocity = 0
		@jumpCooldown = 0
		@controlsMuted = @jumpIsCoolingDown = @interactionIsCoolingDown = @isMovingLeft = @isMovingRight = false
		
		@initialize()
	
	initialize: ->
		super
		
		@playerSprite = new createjs.Shape
		@playerSprite.graphics.beginFill "#0ff"
		@playerSprite.graphics.drawRect 0, 0, @constructor.WIDTH, @constructor.HEIGHT
		@addChild @playerSprite
		
		player = this
		
		$(document).keydown (e) ->
			unless @controlsMuted
				if e.keyCode == JUMP_KEY
					if not player.jumpIsCoolingDown and player.jumpCooldown is 0 and player.onTheGround()
						player.jumpIsCoolingDown = true
						player.jumpCooldown = 4
						player.y -= 3
						player.yVelocity = JUMP_VELOCITY
				if e.keyCode == MOVE_LEFT_KEY
					player.isMovingLeft = true
				if e.keyCode == MOVE_RIGHT_KEY
					player.isMovingRight = true
				if e.keyCode == player.interactionKey
					unless player.interactionIsCoolingDown or player.nearbyPedestal is null
						player.interactionIsCoolingDown = true
						player.interact player.nearbyPedestal
		
		$(document).keyup (e) ->
			if e.keyCode == JUMP_KEY
				player.jumpIsCoolingDown = false
			if e.keyCode == MOVE_LEFT_KEY
				player.isMovingLeft = false
			if e.keyCode == MOVE_RIGHT_KEY
				player.isMovingRight = false
			if e.keyCode == player.interactionKey
				player.interactionIsCoolingDown = false
		
		createjs.Ticker.on "tick", @onTick, null, false, {player: this}
	
	setNearbyPedestal: (nearbyPedestal) ->
		if @nearbyPedestal is null
			@nearbyPedestal = nearbyPedestal
	
	removeNearbyPedestal: (nearbyPedestal) ->
		unless @nearbyPedestal is null
			@nearbyPedestal = null if @nearbyPedestal.id == nearbyPedestal.id
	
	interact: (pedestal) ->
		unless @orbColor is null
			if pedestal.orbColor is null
				pedestal.setOrbColor @orbColor
				pedestal.linkedPedestal.setOrbColor @orbColor
				@removeChild @orbBitmap
				@orbColor = null
				@levelWindow.drawDoorsToCollisionMap()
		else
			@orbColor = pedestal.orbColor
			
			asset = switch @orbColor
				when Color.RED then @assetQueue.getResult "redOrb"
				when Color.GREEN then @assetQueue.getResult "greenOrb"
				when Color.BLUE then @assetQueue.getResult "blueOrb"
			
			@orbBitmap = new createjs.Bitmap asset
			@orbBitmap.regX = 35/2
			@orbBitmap.regY = 35/2
			@orbBitmap.x = -20
			@orbBitmap.y = 5
			@addChild @orbBitmap
			
			pedestal.removeOrb()
			pedestal.linkedPedestal.removeOrb()
			@levelWindow.drawDoorsToCollisionMap()
	
	onTheGround: ->
		@collisionMap.hitTest(@x+2, @y+@constructor.HEIGHT) or @collisionMap.hitTest(@x+2, @y+@constructor.HEIGHT-5) or @collisionMap.hitTest(@x+2, @y+@constructor.HEIGHT-15) or
			@collisionMap.hitTest(@x+@constructor.WIDTH-2, @y+@constructor.HEIGHT) or @collisionMap.hitTest(@x+@constructor.WIDTH-2, @y+@constructor.HEIGHT-5) or @collisionMap.hitTest(@x+@constructor.WIDTH-2, @y+@constructor.HEIGHT-15)
	
	inTheCeiling: ->
		@collisionMap.hitTest(@x+2, @y) or @collisionMap.hitTest(@x+2, @y+10) or @collisionMap.hitTest(@x+2, @y+20) or
			@collisionMap.hitTest(@x+@constructor.WIDTH-2, @y) or @collisionMap.hitTest(@x+@constructor.WIDTH-2, @y+10) or @collisionMap.hitTest(@x+@constructor.WIDTH-2, @y+20)
	
	ranLeftIntoWall: ->
		@collisionMap.hitTest(@x, @y+@constructor.HEIGHT/2)
	
	ranRightIntoWall: ->
		@collisionMap.hitTest(@x+@constructor.WIDTH-10, @y+@constructor.HEIGHT/2)
	
	onTick: (e, data) ->
		player = data.player
		onTheGround = player.onTheGround()
		inTheCeiling = player.inTheCeiling()
		
		unless onTheGround
			player.yVelocity += DECEL if player.yVelocity < MAX_Y_VELOCITY
			
			if player.yVelocity < 0 and inTheCeiling
				player.yVelocity = 1
				# player.yVelocity *= -1
		else
			if player.yVelocity > 0 and not inTheCeiling
				player.y = Math.floor(player.y / 100) * 100 + (90 - player.constructor.HEIGHT)
				player.yVelocity = 0
			
			player.jumpCooldown -= 1 if player.jumpCooldown > 0
		
		player.x -= X_VELOCITY if player.isMovingLeft
		player.x += X_VELOCITY if player.isMovingRight
		player.y += player.yVelocity
		
		player.x = Math.floor(player.x / 100) * 100 + 10 if player.ranLeftIntoWall()
		if player.ranRightIntoWall()
			baseInt = Math.floor(player.x / 100)
			modifier = if baseInt % 7 == 6 then 10 else 0
			player.x = baseInt * 100 + 100 - player.constructor.WIDTH - modifier