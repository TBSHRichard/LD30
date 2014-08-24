class window.Orb extends createjs.Container
	constructor: (@asset) ->
		@initialize()
	
	initialize: ->
		super
		
		spriteSheet = new createjs.SpriteSheet {
			images: [@asset]
			frames: {width: 35, height: 35}
			animations: {
				idle: [0, 7, "idle", 1/3]
			}
		}
		
		@addChild new createjs.Sprite spriteSheet, "idle"