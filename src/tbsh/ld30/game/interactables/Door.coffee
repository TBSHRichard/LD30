class window.Door extends createjs.Sprite
	constructor: (@x, @y, @levelWindow, @color, @isOpen, @orientation, @doorAsset) ->
		@initialize()
	
	initialize: ->
		spriteSheet = new createjs.SpriteSheet {
			images: [@doorAsset]
			frames: {width: 10, height: 90}
			animations: {
				open: {
					frames: [0, 1, 2, 3]
					next: false
				}
				close: {
					frames: [3, 2, 1, 0]
					next: false
				}
			}
		}
		
		super spriteSheet
			
		if @orientation == Orientation.LANDSCAPE
			@rotation = 90
			@scaleY = -1
			@rectWidth = 90
			@rectHeight = 10
			@x += 10
			@y -= 10
		else
			@rectWidth = 10
			@rectHeight = 90
		
		@resetAppearance()
	
	toggleState: ->
		@isOpen = not @isOpen
		@resetAppearance()
		
	resetAppearance: ->
		if @isOpen
			@gotoAndPlay "open"
		else
			@gotoAndPlay "close"