class window.LevelGameWindow extends GameWindow
	constructor: (width, height, @assetQueue) ->
		super width, height
	
	initialize: ->
		super
		
		@doors = []
		
		@setupCollisionMap()
		@setupDoorLayer()
		@drawDoorsToCollisionMap()
		@setupPlayers()
		@setupForeground()
	
	setupCollisionMap: ->
		shape = new createjs.Shape()
		
		@collisionMap = shape
		@collisionMap.alpha = 0
		
		@addChild @collisionMap
	
	drawBaseCollisionMap: (g) ->
		g.beginFill "#000"
		g.moveTo(1010.0, 190.0)
		g.lineTo(1000.0, 190.0)
		g.lineTo(1000.0, 100.0)
		g.lineTo(1010.0, 100.0)
		g.lineTo(1010.0, 190.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(1000.0, 200.0)
		g.lineTo(1070.0, 200.0)
		g.lineTo(1070.0, 190.0)
		g.lineTo(1000.0, 190.0)
		g.lineTo(1000.0, 200.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(1000.0, 90.0)
		g.lineTo(1000.0, 100.0)
		g.lineTo(1110.0, 100.0)
		g.lineTo(1110.0, 90.0)
		g.lineTo(1000.0, 90.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(1610.0, 500.0)
		g.lineTo(1500.0, 500.0)
		g.lineTo(1500.0, 490.0)
		g.lineTo(1610.0, 490.0)
		g.lineTo(1610.0, 500.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(400.0, 90.0)
		g.lineTo(400.0, 100.0)
		g.lineTo(510.0, 100.0)
		g.lineTo(510.0, 90.0)
		g.lineTo(400.0, 90.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(2090.0, 0.0)
		g.lineTo(2090.0, 0.0)
		g.lineTo(10.0, 0.0)
		g.lineTo(10.0, 0.0)
		g.lineTo(0.0, 0.0)
		g.lineTo(0.0, 0.0)
		g.lineTo(0.0, 10.0)
		g.lineTo(0.0, 290.0)
		g.lineTo(0.0, 300.0)
		g.lineTo(0.0, 310.0)
		g.lineTo(0.0, 590.0)
		g.lineTo(0.0, 600.0)
		g.lineTo(10.0, 600.0)
		g.lineTo(2100.0, 600.0)
		g.lineTo(2100.0, 590.0)
		g.lineTo(310.0, 590.0)
		g.lineTo(310.0, 500.0)
		g.lineTo(510.0, 500.0)
		g.lineTo(510.0, 490.0)
		g.lineTo(300.0, 490.0)
		g.lineTo(300.0, 500.0)
		g.lineTo(300.0, 590.0)
		g.lineTo(10.0, 590.0)
		g.lineTo(10.0, 310.0)
		g.lineTo(100.0, 310.0)
		g.lineTo(100.0, 500.0)
		g.lineTo(110.0, 500.0)
		g.lineTo(210.0, 500.0)
		g.lineTo(210.0, 490.0)
		g.lineTo(210.0, 400.0)
		g.lineTo(210.0, 390.0)
		g.lineTo(110.0, 390.0)
		g.lineTo(110.0, 310.0)
		g.lineTo(690.0, 310.0)
		g.lineTo(690.0, 500.0)
		g.lineTo(700.0, 500.0)
		g.lineTo(710.0, 500.0)
		g.lineTo(710.0, 310.0)
		g.lineTo(1000.0, 310.0)
		g.lineTo(1000.0, 500.0)
		g.lineTo(1010.0, 500.0)
		g.lineTo(1110.0, 500.0)
		g.lineTo(1110.0, 490.0)
		g.lineTo(1110.0, 400.0)
		g.lineTo(1110.0, 390.0)
		g.lineTo(1010.0, 390.0)
		g.lineTo(1010.0, 400.0)
		g.lineTo(1100.0, 400.0)
		g.lineTo(1100.0, 490.0)
		g.lineTo(1010.0, 490.0)
		g.lineTo(1010.0, 310.0)
		g.lineTo(1390.0, 310.0)
		g.lineTo(1390.0, 490.0)
		g.lineTo(1300.0, 490.0)
		g.lineTo(1300.0, 500.0)
		g.lineTo(1390.0, 500.0)
		g.lineTo(1400.0, 500.0)
		g.lineTo(1410.0, 500.0)
		g.lineTo(1410.0, 310.0)
		g.lineTo(1800.0, 310.0)
		g.lineTo(1800.0, 400.0)
		g.lineTo(1810.0, 400.0)
		g.lineTo(1810.0, 310.0)
		g.lineTo(2090.0, 310.0)
		g.lineTo(2090.0, 490.0)
		g.lineTo(2010.0, 490.0)
		g.lineTo(2010.0, 390.0)
		g.lineTo(2000.0, 390.0)
		g.lineTo(1910.0, 390.0)
		g.lineTo(1900.0, 390.0)
		g.lineTo(1900.0, 490.0)
		g.lineTo(1800.0, 490.0)
		g.lineTo(1800.0, 500.0)
		g.lineTo(1900.0, 500.0)
		g.lineTo(1910.0, 500.0)
		g.lineTo(1910.0, 400.0)
		g.lineTo(2000.0, 400.0)
		g.lineTo(2000.0, 490.0)
		g.lineTo(2000.0, 500.0)
		g.lineTo(2090.0, 500.0)
		g.lineTo(2100.0, 500.0)
		g.lineTo(2100.0, 310.0)
		g.lineTo(2100.0, 300.0)
		g.lineTo(2100.0, 290.0)
		g.lineTo(910.0, 290.0)
		g.lineTo(910.0, 190.0)
		g.lineTo(900.0, 190.0)
		g.lineTo(900.0, 290.0)
		g.lineTo(410.0, 290.0)
		g.lineTo(410.0, 200.0)
		g.lineTo(510.0, 200.0)
		g.lineTo(510.0, 190.0)
		g.lineTo(300.0, 190.0)
		g.lineTo(300.0, 200.0)
		g.lineTo(300.0, 290.0)
		g.lineTo(10.0, 290.0)
		g.lineTo(10.0, 10.0)
		g.lineTo(200.0, 10.0)
		g.lineTo(200.0, 90.0)
		g.lineTo(100.0, 90.0)
		g.lineTo(100.0, 100.0)
		g.lineTo(200.0, 100.0)
		g.lineTo(200.0, 190.0)
		g.lineTo(100.0, 190.0)
		g.lineTo(100.0, 200.0)
		g.lineTo(200.0, 200.0)
		g.lineTo(210.0, 200.0)
		g.lineTo(210.0, 10.0)
		g.lineTo(690.0, 10.0)
		g.lineTo(690.0, 200.0)
		g.lineTo(700.0, 200.0)
		g.lineTo(700.0, 200.0)
		g.lineTo(710.0, 200.0)
		g.lineTo(710.0, 10.0)
		g.lineTo(1390.0, 10.0)
		g.lineTo(1390.0, 200.0)
		g.lineTo(1400.0, 200.0)
		g.lineTo(1410.0, 200.0)
		g.lineTo(1410.0, 10.0)
		g.lineTo(1500.0, 10.0)
		g.lineTo(1500.0, 200.0)
		g.lineTo(1510.0, 200.0)
		g.lineTo(1510.0, 10.0)
		g.lineTo(2090.0, 10.0)
		g.lineTo(2090.0, 90.0)
		g.lineTo(2010.0, 90.0)
		g.lineTo(2000.0, 90.0)
		g.lineTo(2000.0, 190.0)
		g.lineTo(1810.0, 190.0)
		g.lineTo(1810.0, 100.0)
		g.lineTo(1910.0, 100.0)
		g.lineTo(1910.0, 90.0)
		g.lineTo(1810.0, 90.0)
		g.lineTo(1800.0, 90.0)
		g.lineTo(1800.0, 190.0)
		g.lineTo(1800.0, 200.0)
		g.lineTo(2090.0, 200.0)
		g.lineTo(2090.0, 200.0)
		g.lineTo(2100.0, 200.0)
		g.lineTo(2100.0, 10.0)
		g.lineTo(2100.0, 0.0)
		g.lineTo(2100.0, 0.0)
		g.lineTo(2090.0, 0.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(200.0, 400.0)
		g.lineTo(200.0, 490.0)
		g.lineTo(110.0, 490.0)
		g.lineTo(110.0, 400.0)
		g.lineTo(200.0, 400.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(310.0, 200.0)
		g.lineTo(400.0, 200.0)
		g.lineTo(400.0, 290.0)
		g.lineTo(310.0, 290.0)
		g.lineTo(310.0, 200.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(2090.0, 190.0)
		g.lineTo(2010.0, 190.0)
		g.lineTo(2010.0, 100.0)
		g.lineTo(2090.0, 100.0)
		g.lineTo(2090.0, 190.0)
		g.endFill()
	
	drawDoorsToCollisionMap: ->
		@collisionMap.graphics.clear()
		@drawBaseCollisionMap @collisionMap.graphics
		for door in @doors
			unless door.isOpen
				@collisionMap.graphics.beginFill "#000"
				@collisionMap.graphics.drawRect door.x, door.y, door.rectWidth, door.rectHeight
				@collisionMap.graphics.endFill()
	
	setupDoorLayer: ->
		@doorLayer = new createjs.Container()
		
		# Room 1 - Top
		@addDoorToLayer new Door 100, 100, this, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 200, 200, this, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 400, 100, this, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 500, 100, this, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 500, 200, this, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		
		# Room 1 - Bottom
		@addDoorToLayer new Door 100, 500, this, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 500, 500, this, Door.COLOR_GREEN, false, Door.ORIENTATION_PORTRAIT
		
		# Room 2 - Top
		@addDoorToLayer new Door 900, 200, this, Door.COLOR_GREEN, false, Door.ORIENTATION_LANDSCAPE
		
		# Room 2 - Bottom
		@addDoorToLayer new Door 1000, 500, this, Door.COLOR_GREEN, false, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 1300, 500, this, Door.COLOR_BLUE, false, Door.ORIENTATION_PORTRAIT
		
		# Room 3 - Top
		@addDoorToLayer new Door 1500, 200, this, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 1700, 200, this, Door.COLOR_BLUE, true, Door.ORIENTATION_LANDSCAPE
		@addDoorToLayer new Door 1800, 200, this, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 2000, 200, this, Door.COLOR_BLUE, false, Door.ORIENTATION_PORTRAIT
		
		# Room 3 - Bottom
		@addDoorToLayer new Door 1500, 500, this, Door.COLOR_RED, true, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 1600, 500, this, Door.COLOR_BLUE, false, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 1800, 500, this, Door.COLOR_GREEN, false, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 1800, 400, this, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@addDoorToLayer new Door 1800, 400, this, Door.COLOR_RED, false, Door.ORIENTATION_LANDSCAPE
		
		@addChild @doorLayer
	
	addDoorToLayer: (door) ->
		@doorLayer.addChild door
		@doors.push door
	
	setupPlayers: ->
		@topPlayer = new TopDimensionPlayer @collisionMap
		@topPlayer.x = 25
		@topPlayer.y = 220
		
		@bottomPlayer = new BottomDimensionPlayer @collisionMap
		@bottomPlayer.x = 25
		@bottomPlayer.y = 520
		
		@addChild @topPlayer
		@addChild @bottomPlayer
	
	setupForeground: ->
		@addChild new createjs.Bitmap @assetQueue.getResult "foreground"