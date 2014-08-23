class window.Door extends createjs.Shape
	@COLOR_RED = 0
	@COLOR_GREEN = 1
	@COLOR_BLUE = 2

	@ORIENTATION_LANDSCAPE = 3
	@ORIENTATION_PORTRAIT = 4
	
	constructor: (@x, @y, @collisionLayer, @color, @isOpen, @orientation) ->
		@initialize()
	
	initialize: ->
		super
		
		c = switch @color
			when @constructor.COLOR_RED then "#f00"
			when @constructor.COLOR_GREEN then "#0f0"
			when @constructor.COLOR_BLUE then "#00f"
			
		if @orientation == @constructor.ORIENTATION_LANDSCAPE
			rectWidth = 90
			rectHeight = 10
			@x += 10
			@y -= 10
		else
			rectWidth = 10
			rectHeight = 90
		
		@graphics.beginFill c
		@graphics.drawRect 0, 0, rectWidth, rectHeight
		
		@hitBox = new createjs.Shape()
		@hitBox.x = @x
		@hitBox.y = @y
		@hitBox.graphics.beginFill "#000"
		@hitBox.graphics.drawRect 0, 0, rectWidth, rectHeight
		
		@resetAppearance()
	
	toggleState: ->
		@isOpen = not @isOpen
		@resetAppearance()
		
	resetAppearance: ->
		if @isOpen
			@alpha = 0.3
			@collisionLayer.removeChild @hitBox
		else
			@alpha = 1
			@collisionLayer.addChild @hitBox