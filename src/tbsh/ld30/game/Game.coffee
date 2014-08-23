FADESTATE_IN = 0
FADESTATE_OFF = 1
FADESTATE_OUT = 2

WIDTH = 700
HEIGHT = 600

game = null

class window.Game
	constructor: (@width, @height, gameWindow) ->
		game = this
		@stage = new createjs.Stage "gameCanvas"
		createjs.Ticker.addEventListener "tick", @onTick
		@gwAlpha = 0
		@setWindow gameWindow
	
	setWindow: (gw) ->
		@nextGameWindow = gw
		
		if @gameWindow
			@fadestate = FADESTATE_OUT
		else
			@gameWindow = @nextGameWindow
			@gameWindow.setGame this
			@stage.addChild @gameWindow
			@nextGameWindow = null
			@gameWindow.alpha = @gwAlpha
			@fadestate = FADESTATE_IN
	
	setAssetQueue: (@assetQueue) ->
	
	onTick: ->
		if game.gameWindow
			switch game.fadestate
				when FADESTATE_IN
					game.gwAlpha += 1/30
					game.gameWindow.alpha = game.gwAlpha
					
					if game.gwAlpha >= 1
						game.gameWindow.alpha = 1
						game.fadestate = FADESTATE_OFF
				when FADESTATE_OUT
					game.gwAlpha -= 1/30
					game.gameWindow.alpha = game.gwAlpha
					
					if game.gwAlpha <= 0
						game.stage.removeChild game.gameWindow
						game.gameWindow = game.nextGameWindow
						game.gameWindow.setGame game
						game.stage.addChild game.gameWindow
						game.nextGameWindow = null
						game.gameWindow.alpha = 0
						game.fadestate = FADESTATE_IN
			
			game.gameWindow.onTick()
		game.stage.update()