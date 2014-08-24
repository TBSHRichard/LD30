WIDTH = 35
HEIGHT = 60
DECEL = 4
JUMP_VELOCITY = -35
MAX_Y_VELOCITY = 15
X_VELOCITY = 10
JUMP_KEY = 38
MOVE_LEFT_KEY = 37
MOVE_RIGHT_KEY = 39

class window.Player extends createjs.Shape
	constructor: (@collisionMap, @spriteSheet, @interactionKey) ->
		@orb = null
		@xVelocity = 0
		@yVelocity = 0
		@jumpIsCoolingDown = @isMovingLeft = @isMovingRight = false
		
		@initialize()
	
	initialize: ->
		super
		
		@graphics.beginFill "#0ff"
		@graphics.drawRect 0, 0, WIDTH, HEIGHT
		
		player = this
		
		$(document).keydown (e) ->
				if e.keyCode == JUMP_KEY
					if not player.jumpIsCoolingDown and player.onTheGround()
						player.jumpIsCoolingDown = true
						player.y -= 3
						player.yVelocity = JUMP_VELOCITY
				if e.keyCode == MOVE_LEFT_KEY
					player.isMovingLeft = true
				if e.keyCode == MOVE_RIGHT_KEY
					player.isMovingRight = true
		
		$(document).keyup (e) ->
				if e.keyCode == JUMP_KEY
					player.jumpIsCoolingDown = false
				if e.keyCode == MOVE_LEFT_KEY
					player.isMovingLeft = false
				if e.keyCode == MOVE_RIGHT_KEY
					player.isMovingRight = false
		
		createjs.Ticker.on "tick", @onTick, null, false, {player: this}
	
	interact: (pedestal) ->
		unless @orb is null
			pedestal.setOrb @orb
			@orb = null
		else
			@orb = pedestal.orb
			pedestal.removeOrb()
	
	onTheGround: ->
		@collisionMap.hitTest(@x+2, @y+HEIGHT) or @collisionMap.hitTest(@x+2, @y+HEIGHT-15) or
			@collisionMap.hitTest(@x+WIDTH-2, @y+HEIGHT) or @collisionMap.hitTest(@x+WIDTH-2, @y+HEIGHT-15)
	
	hitHead: ->
		@yVelocity < 0 and (@collisionMap.hitTest(@x+2, @y) or @collisionMap.hitTest(@x+WIDTH-2, @y))
	
	ranLeftIntoWall: ->
		@collisionMap.hitTest(@x, @y+HEIGHT/2)
	
	ranRightIntoWall: ->
		@collisionMap.hitTest(@x+WIDTH-10, @y+HEIGHT/2)
	
	onTick: (e, data) ->
		player = data.player
		
		unless player.onTheGround()
			player.yVelocity += DECEL if player.yVelocity < MAX_Y_VELOCITY
			
			if player.hitHead()
				#player.y = Math.ceil(player.y / 100) * 100
				player.yVelocity *= -1
		else
			if player.yVelocity > 0
				player.y = Math.floor(player.y / 100) * 100 + (90 - HEIGHT)
				player.yVelocity = 0
		
		player.x -= X_VELOCITY if player.isMovingLeft
		player.x += X_VELOCITY if player.isMovingRight
		player.y += player.yVelocity
		
		player.x = Math.floor(player.x / 100) * 100 + 10 if player.ranLeftIntoWall()
		player.x = Math.floor(player.x / 100) * 100 + 100 - WIDTH if player.ranRightIntoWall()