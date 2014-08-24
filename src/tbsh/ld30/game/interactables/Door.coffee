class window.Door extends createjs.Shape
	constructor: (@x, @y, @levelWindow, @color, @isOpen, @orientation) ->
		@initialize()
	
	initialize: ->
		super
		
		c = switch @color
			when Color.RED then "#f00"
			when Color.GREEN then "#0f0"
			when Color.BLUE then "#00f"
			
		if @orientation == Orientation.LANDSCAPE
			@rectWidth = 90
			@rectHeight = 10
			@x += 10
			@y -= 10
		else
			@rectWidth = 10
			@rectHeight = 90
		
		@graphics.beginFill c
		@graphics.drawRect 0, 0, @rectWidth, @rectHeight
		
		@resetAppearance()
	
	toggleState: ->
		@isOpen = not @isOpen
		@resetAppearance()
		
	resetAppearance: ->
		if @isOpen
			@alpha = 0.3
		else
			@alpha = 1