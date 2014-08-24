class window.LevelGameWindow extends GameWindow
	constructor: (width, height, @assetQueue) ->
		super width, height
	
	initialize: ->
		super
		
		@levelLayer = new createjs.Container()
		@doors = []
		
		@setupCollisionMap()
		@setupPedestalBitmap()
		@setupDoorLayer()
		@drawDoorsToCollisionMap()
		@setupPlayers()
		@setupForeground()
		@setupTriggers()
		
		@addChild @levelLayer
	
	setupCollisionMap: ->
		shape = new createjs.Shape()
		
		@collisionMap = shape
		@collisionMap.alpha = 0
		
		@levelLayer.addChild @collisionMap
	
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
		g.lineTo(1600.0, 10.0)
		g.lineTo(1600.0, 200.0)
		g.lineTo(1610.0, 200.0)
		g.lineTo(1610.0, 10.0)
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
		
		g.beginFill "#000"
		g.moveTo(690.0, 200.0)
		g.lineTo(700.0, 200.0)
		g.lineTo(700.0, 290.0)
		g.lineTo(690.0, 290.0)
		g.lineTo(690.0, 200.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(700.0, 200.0)
		g.lineTo(710.0, 200.0)
		g.lineTo(710.0, 290.0)
		g.lineTo(700.0, 290.0)
		g.lineTo(700.0, 200.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(1390.0, 200.0)
		g.lineTo(1400.0, 200.0)
		g.lineTo(1400.0, 290.0)
		g.lineTo(1390.0, 290.0)
		g.lineTo(1490.0, 200.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(1400.0, 200.0)
		g.lineTo(1410.0, 200.0)
		g.lineTo(1410.0, 290.0)
		g.lineTo(1400.0, 290.0)
		g.lineTo(1400.0, 200.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(2090.0, 200.0)
		g.lineTo(2100.0, 200.0)
		g.lineTo(2100.0, 290.0)
		g.lineTo(2090.0, 290.0)
		g.lineTo(2090.0, 200.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(690.0, 500.0)
		g.lineTo(700.0, 500.0)
		g.lineTo(700.0, 590.0)
		g.lineTo(690.0, 590.0)
		g.lineTo(690.0, 500.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(700.0, 500.0)
		g.lineTo(710.0, 500.0)
		g.lineTo(710.0, 590.0)
		g.lineTo(700.0, 590.0)
		g.lineTo(700.0, 500.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(1390.0, 500.0)
		g.lineTo(1400.0, 500.0)
		g.lineTo(1400.0, 590.0)
		g.lineTo(1390.0, 590.0)
		g.lineTo(1490.0, 500.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(1400.0, 500.0)
		g.lineTo(1410.0, 500.0)
		g.lineTo(1410.0, 590.0)
		g.lineTo(1400.0, 590.0)
		g.lineTo(1400.0, 500.0)
		g.endFill()
		
		g.beginFill "#000"
		g.moveTo(2090.0, 500.0)
		g.lineTo(2100.0, 500.0)
		g.lineTo(2100.0, 590.0)
		g.lineTo(2090.0, 590.0)
		g.lineTo(2090.0, 500.0)
		g.endFill()
	
	drawDoorsToCollisionMap: ->
		@collisionMap.graphics.clear()
		@drawBaseCollisionMap @collisionMap.graphics
		for door in @doors
			unless door.isOpen
				@collisionMap.graphics.beginFill "#000"
				@collisionMap.graphics.drawRect door.x, door.y, door.rectWidth, door.rectHeight
				@collisionMap.graphics.endFill()
	
	setupPedestalBitmap: ->
		@pedestalBitmapLayer = new createjs.Container()
		
		@pedestalBitmapLayer.addChild new createjs.Bitmap @assetQueue.getResult "pedestals"
		
		@levelLayer.addChild @pedestalBitmapLayer
		
		overlayShape = new createjs.Shape()
		overlayShape.graphics.beginFill "#000"
		overlayShape.graphics.drawRect 0, 0, 2100, 600
		overlayShape.alpha = 0.05
		@levelLayer.addChild overlayShape
	
	setupDoorLayer: ->
		@doorLayer = new createjs.Container()
		
		@pedestal1ADoors = []
		@pedestal1BDoors = []
		@pedestal1CDoors = []
		@pedestal1EDoors = []
		@pedestal1GDoors = []
		@pedestal1JDoors = []
		@pedestal2ADoors = []
		@pedestal2DDoors = []
		@pedestal2FDoors = []
		@pedestal3ADoors = []
		@pedestal3BDoors = []
		@pedestal3CDoors = []
		@pedestal3EDoors = []
		@pedestal3FDoors = []
		@pedestal3GDoors = []
		@pedestal3HDoors = []
		@pedestal3IDoors = []
		
		# Room 1 - Top
		@pedestal1ADoors.push @addDoorToLayer new Door 100, 100, this, Color.GREEN, true, Orientation.PORTRAIT
		@pedestal1BDoors.push @addDoorToLayer new Door 200, 200, this, Color.RED, false, Orientation.PORTRAIT
		@pedestal1CDoors.push @addDoorToLayer new Door 400, 100, this, Color.GREEN, true, Orientation.PORTRAIT
		@pedestal1CDoors.push @addDoorToLayer new Door 500, 100, this, Color.GREEN, true, Orientation.PORTRAIT
		@pedestal1EDoors.push @addDoorToLayer new Door 500, 200, this, Color.GREEN, true, Orientation.PORTRAIT
		
		# Room 1 - Bottom
		@pedestal1GDoors.push @addDoorToLayer new Door 100, 500, this, Color.RED, false, Orientation.PORTRAIT
		@pedestal1JDoors.push @addDoorToLayer new Door 500, 500, this, Color.GREEN, false, Orientation.PORTRAIT
		
		# Room 2 - Top
		@pedestal2ADoors.push @addDoorToLayer new Door 900, 200, this, Color.GREEN, false, Orientation.LANDSCAPE
		
		# Room 2 - Bottom
		@pedestal2DDoors.push @addDoorToLayer new Door 1000, 500, this, Color.GREEN, false, Orientation.PORTRAIT
		@pedestal2FDoors.push @addDoorToLayer new Door 1300, 500, this, Color.BLUE, false, Orientation.PORTRAIT
		
		# Room 3 - Top
		redDoorTop = @addDoorToLayer new Door 1500, 200, this, Color.RED, false, Orientation.PORTRAIT
		@pedestal3ADoors.push redDoorTop
		@pedestal3BDoors.push redDoorTop
		@pedestal3CDoors.push @addDoorToLayer new Door 1700, 200, this, Color.BLUE, true, Orientation.LANDSCAPE
		@pedestal3CDoors.push @addDoorToLayer new Door 1800, 200, this, Color.GREEN, true, Orientation.PORTRAIT
		@pedestal3EDoors.push @addDoorToLayer new Door 2000, 200, this, Color.BLUE, false, Orientation.PORTRAIT
		
		# Room 3 - Bottom
		@pedestal3FDoors.push @addDoorToLayer new Door 1600, 500, this, Color.RED, true, Orientation.PORTRAIT
		blueDoorBottom = @addDoorToLayer new Door 1600, 500, this, Color.BLUE, false, Orientation.PORTRAIT
		@pedestal3FDoors.push blueDoorBottom
		@pedestal3GDoors.push blueDoorBottom
		@pedestal3HDoors.push @addDoorToLayer new Door 1800, 500, this, Color.GREEN, false, Orientation.PORTRAIT
		@pedestal3IDoors.push @addDoorToLayer new Door 1800, 400, this, Color.RED, false, Orientation.PORTRAIT
		@pedestal3IDoors.push @addDoorToLayer new Door 1800, 400, this, Color.RED, false, Orientation.LANDSCAPE
		
		@levelLayer.addChild @doorLayer
	
	addDoorToLayer: (door) ->
		@doorLayer.addChild door
		@doors.push door
		return door
	
	setupPlayers: ->
		@topPlayer = new TopDimensionPlayer this, @collisionMap, @assetQueue
		@topPlayer.x = 25
		@topPlayer.y = 220
		
		@bottomPlayer = new BottomDimensionPlayer this, @collisionMap, @assetQueue
		@bottomPlayer.x = 25
		@bottomPlayer.y = 520
		
		@levelLayer.addChild @topPlayer
		@levelLayer.addChild @bottomPlayer
	
	setupForeground: ->
		@levelLayer.addChild new createjs.Bitmap @assetQueue.getResult "foreground"
	
	setupTriggers: ->
		@room1TopTriggers = []
		@room1BottomTriggers = []
		
		# Room 1 Room Triggers
		topRoomTrigger = new TopRoomTrigger 684, 200, Direction.RIGHT, @unwatchTriggersInRoom1, this, @topPlayer
		@room1TopTriggers.push topRoomTrigger
		
		bottomRoomTrigger = new RoomTrigger 684, 500, Direction.RIGHT, @unwatchTriggersInRoom1, this, @bottomPlayer
		@room1BottomTriggers.push bottomRoomTrigger
		
		topRoomTrigger.setLinkedTrigger bottomRoomTrigger
		bottomRoomTrigger.setLinkedTrigger topRoomTrigger
		
		# Room 1 A & F
		pedestal1A = new PedestalTrigger "1A", 150, 125, this, @assetQueue, @pedestalBitmapLayer
		pedestal1A.setLinkedDoors @pedestal1ADoors
		@room1TopTriggers.push pedestal1A
		
		pedestal1F = new PedestalTrigger "1F", 150, 425, this, @assetQueue, @pedestalBitmapLayer
		@room1BottomTriggers.push pedestal1F
		
		pedestal1A.setLinkedPedestal pedestal1F
		pedestal1F.setLinkedPedestal pedestal1A
		
		# Room 1 B & G
		pedestal1B = new PedestalTrigger "1B", 150, 225, this, @assetQueue, @pedestalBitmapLayer
		pedestal1B.setLinkedDoors @pedestal1BDoors
		@room1TopTriggers.push pedestal1B
		
		pedestal1G = new PedestalTrigger "1G", 150, 525, this, @assetQueue, @pedestalBitmapLayer
		pedestal1G.setLinkedDoors @pedestal1GDoors
		@room1BottomTriggers.push pedestal1G
		
		pedestal1B.setLinkedPedestal pedestal1G
		pedestal1G.setLinkedPedestal pedestal1B
		
		pedestal1A.setOrbColor Color.RED
		pedestal1F.setOrbColor Color.RED
		
		@watchTriggersInRoom1()
	
	watchTriggersInRoom1: ->
		for trigger in @room1TopTriggers
			trigger.watchPlayer @topPlayer
		
		for trigger in @room1BottomTriggers
			trigger.watchPlayer @bottomPlayer
	
	unwatchTriggersInRoom1: (levelWindow) ->
		for trigger in levelWindow.room1TopTriggers
			trigger.unwatchPlayer()
		
		for trigger in levelWindow.room1BottomTriggers
			trigger.unwatchPlayer()