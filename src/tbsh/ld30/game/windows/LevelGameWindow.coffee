class window.LevelGameWindow extends GameWindow
	initialize: ->
		super
		
		@setupCollisionLayer()
		@setupDoorLayer()
	
	setupCollisionLayer: ->
		@collisionLayer = new createjs.Container()
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(1010.0, 190.0)
		shape.graphics.lineTo(1000.0, 190.0)
		shape.graphics.lineTo(1000.0, 100.0)
		shape.graphics.lineTo(1010.0, 100.0)
		shape.graphics.lineTo(1010.0, 190.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(1000.0, 200.0)
		shape.graphics.lineTo(1070.0, 200.0)
		shape.graphics.lineTo(1070.0, 190.0)
		shape.graphics.lineTo(1000.0, 190.0)
		shape.graphics.lineTo(1000.0, 200.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(1000.0, 90.0)
		shape.graphics.lineTo(1000.0, 100.0)
		shape.graphics.lineTo(1110.0, 100.0)
		shape.graphics.lineTo(1110.0, 90.0)
		shape.graphics.lineTo(1000.0, 90.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(1610.0, 500.0)
		shape.graphics.lineTo(1500.0, 500.0)
		shape.graphics.lineTo(1500.0, 490.0)
		shape.graphics.lineTo(1610.0, 490.0)
		shape.graphics.lineTo(1610.0, 500.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(400.0, 90.0)
		shape.graphics.lineTo(400.0, 100.0)
		shape.graphics.lineTo(510.0, 100.0)
		shape.graphics.lineTo(510.0, 90.0)
		shape.graphics.lineTo(400.0, 90.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(2090.0, 0.0)
		shape.graphics.lineTo(2090.0, 0.0)
		shape.graphics.lineTo(10.0, 0.0)
		shape.graphics.lineTo(10.0, 0.0)
		shape.graphics.lineTo(0.0, 0.0)
		shape.graphics.lineTo(0.0, 0.0)
		shape.graphics.lineTo(0.0, 10.0)
		shape.graphics.lineTo(0.0, 290.0)
		shape.graphics.lineTo(0.0, 300.0)
		shape.graphics.lineTo(0.0, 310.0)
		shape.graphics.lineTo(0.0, 590.0)
		shape.graphics.lineTo(0.0, 600.0)
		shape.graphics.lineTo(10.0, 600.0)
		shape.graphics.lineTo(2100.0, 600.0)
		shape.graphics.lineTo(2100.0, 590.0)
		shape.graphics.lineTo(310.0, 590.0)
		shape.graphics.lineTo(310.0, 500.0)
		shape.graphics.lineTo(510.0, 500.0)
		shape.graphics.lineTo(510.0, 490.0)
		shape.graphics.lineTo(300.0, 490.0)
		shape.graphics.lineTo(300.0, 500.0)
		shape.graphics.lineTo(300.0, 590.0)
		shape.graphics.lineTo(10.0, 590.0)
		shape.graphics.lineTo(10.0, 310.0)
		shape.graphics.lineTo(100.0, 310.0)
		shape.graphics.lineTo(100.0, 500.0)
		shape.graphics.lineTo(110.0, 500.0)
		shape.graphics.lineTo(210.0, 500.0)
		shape.graphics.lineTo(210.0, 490.0)
		shape.graphics.lineTo(210.0, 400.0)
		shape.graphics.lineTo(210.0, 390.0)
		shape.graphics.lineTo(110.0, 390.0)
		shape.graphics.lineTo(110.0, 310.0)
		shape.graphics.lineTo(690.0, 310.0)
		shape.graphics.lineTo(690.0, 500.0)
		shape.graphics.lineTo(700.0, 500.0)
		shape.graphics.lineTo(710.0, 500.0)
		shape.graphics.lineTo(710.0, 310.0)
		shape.graphics.lineTo(1000.0, 310.0)
		shape.graphics.lineTo(1000.0, 500.0)
		shape.graphics.lineTo(1010.0, 500.0)
		shape.graphics.lineTo(1110.0, 500.0)
		shape.graphics.lineTo(1110.0, 490.0)
		shape.graphics.lineTo(1110.0, 400.0)
		shape.graphics.lineTo(1110.0, 390.0)
		shape.graphics.lineTo(1010.0, 390.0)
		shape.graphics.lineTo(1010.0, 400.0)
		shape.graphics.lineTo(1100.0, 400.0)
		shape.graphics.lineTo(1100.0, 490.0)
		shape.graphics.lineTo(1010.0, 490.0)
		shape.graphics.lineTo(1010.0, 310.0)
		shape.graphics.lineTo(1390.0, 310.0)
		shape.graphics.lineTo(1390.0, 490.0)
		shape.graphics.lineTo(1300.0, 490.0)
		shape.graphics.lineTo(1300.0, 500.0)
		shape.graphics.lineTo(1390.0, 500.0)
		shape.graphics.lineTo(1400.0, 500.0)
		shape.graphics.lineTo(1410.0, 500.0)
		shape.graphics.lineTo(1410.0, 310.0)
		shape.graphics.lineTo(1800.0, 310.0)
		shape.graphics.lineTo(1800.0, 400.0)
		shape.graphics.lineTo(1810.0, 400.0)
		shape.graphics.lineTo(1810.0, 310.0)
		shape.graphics.lineTo(2090.0, 310.0)
		shape.graphics.lineTo(2090.0, 490.0)
		shape.graphics.lineTo(2010.0, 490.0)
		shape.graphics.lineTo(2010.0, 390.0)
		shape.graphics.lineTo(2000.0, 390.0)
		shape.graphics.lineTo(1910.0, 390.0)
		shape.graphics.lineTo(1900.0, 390.0)
		shape.graphics.lineTo(1900.0, 490.0)
		shape.graphics.lineTo(1800.0, 490.0)
		shape.graphics.lineTo(1800.0, 500.0)
		shape.graphics.lineTo(1900.0, 500.0)
		shape.graphics.lineTo(1910.0, 500.0)
		shape.graphics.lineTo(1910.0, 400.0)
		shape.graphics.lineTo(2000.0, 400.0)
		shape.graphics.lineTo(2000.0, 490.0)
		shape.graphics.lineTo(2000.0, 500.0)
		shape.graphics.lineTo(2090.0, 500.0)
		shape.graphics.lineTo(2100.0, 500.0)
		shape.graphics.lineTo(2100.0, 310.0)
		shape.graphics.lineTo(2100.0, 300.0)
		shape.graphics.lineTo(2100.0, 290.0)
		shape.graphics.lineTo(910.0, 290.0)
		shape.graphics.lineTo(910.0, 190.0)
		shape.graphics.lineTo(900.0, 190.0)
		shape.graphics.lineTo(900.0, 290.0)
		shape.graphics.lineTo(410.0, 290.0)
		shape.graphics.lineTo(410.0, 200.0)
		shape.graphics.lineTo(510.0, 200.0)
		shape.graphics.lineTo(510.0, 190.0)
		shape.graphics.lineTo(300.0, 190.0)
		shape.graphics.lineTo(300.0, 200.0)
		shape.graphics.lineTo(300.0, 290.0)
		shape.graphics.lineTo(10.0, 290.0)
		shape.graphics.lineTo(10.0, 10.0)
		shape.graphics.lineTo(200.0, 10.0)
		shape.graphics.lineTo(200.0, 90.0)
		shape.graphics.lineTo(100.0, 90.0)
		shape.graphics.lineTo(100.0, 100.0)
		shape.graphics.lineTo(200.0, 100.0)
		shape.graphics.lineTo(200.0, 190.0)
		shape.graphics.lineTo(100.0, 190.0)
		shape.graphics.lineTo(100.0, 200.0)
		shape.graphics.lineTo(200.0, 200.0)
		shape.graphics.lineTo(210.0, 200.0)
		shape.graphics.lineTo(210.0, 10.0)
		shape.graphics.lineTo(690.0, 10.0)
		shape.graphics.lineTo(690.0, 200.0)
		shape.graphics.lineTo(700.0, 200.0)
		shape.graphics.lineTo(700.0, 200.0)
		shape.graphics.lineTo(710.0, 200.0)
		shape.graphics.lineTo(710.0, 10.0)
		shape.graphics.lineTo(1390.0, 10.0)
		shape.graphics.lineTo(1390.0, 200.0)
		shape.graphics.lineTo(1400.0, 200.0)
		shape.graphics.lineTo(1410.0, 200.0)
		shape.graphics.lineTo(1410.0, 10.0)
		shape.graphics.lineTo(1500.0, 10.0)
		shape.graphics.lineTo(1500.0, 200.0)
		shape.graphics.lineTo(1510.0, 200.0)
		shape.graphics.lineTo(1510.0, 10.0)
		shape.graphics.lineTo(2090.0, 10.0)
		shape.graphics.lineTo(2090.0, 90.0)
		shape.graphics.lineTo(2010.0, 90.0)
		shape.graphics.lineTo(2000.0, 90.0)
		shape.graphics.lineTo(2000.0, 190.0)
		shape.graphics.lineTo(1810.0, 190.0)
		shape.graphics.lineTo(1810.0, 100.0)
		shape.graphics.lineTo(1910.0, 100.0)
		shape.graphics.lineTo(1910.0, 90.0)
		shape.graphics.lineTo(1810.0, 90.0)
		shape.graphics.lineTo(1800.0, 90.0)
		shape.graphics.lineTo(1800.0, 190.0)
		shape.graphics.lineTo(1800.0, 200.0)
		shape.graphics.lineTo(2090.0, 200.0)
		shape.graphics.lineTo(2090.0, 200.0)
		shape.graphics.lineTo(2100.0, 200.0)
		shape.graphics.lineTo(2100.0, 10.0)
		shape.graphics.lineTo(2100.0, 0.0)
		shape.graphics.lineTo(2100.0, 0.0)
		shape.graphics.lineTo(2090.0, 0.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(200.0, 400.0)
		shape.graphics.lineTo(200.0, 490.0)
		shape.graphics.lineTo(110.0, 490.0)
		shape.graphics.lineTo(110.0, 400.0)
		shape.graphics.lineTo(200.0, 400.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(310.0, 200.0)
		shape.graphics.lineTo(400.0, 200.0)
		shape.graphics.lineTo(400.0, 290.0)
		shape.graphics.lineTo(310.0, 290.0)
		shape.graphics.lineTo(310.0, 200.0)
		@collisionLayer.addChild shape
		
		shape = new createjs.Shape()
		shape.graphics.beginFill "#000"
		shape.graphics.moveTo(2090.0, 190.0)
		shape.graphics.lineTo(2010.0, 190.0)
		shape.graphics.lineTo(2010.0, 100.0)
		shape.graphics.lineTo(2090.0, 100.0)
		shape.graphics.lineTo(2090.0, 190.0)
		@collisionLayer.addChild shape
		
		@addChild @collisionLayer
	
	setupDoorLayer: ->
		@doorLayer = new createjs.Container()
		
		# Room 1 - Top
		@doorLayer.addChild new Door 100, 100, @collisionLayer, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 200, 200, @collisionLayer, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 400, 100, @collisionLayer, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 500, 100, @collisionLayer, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 500, 200, @collisionLayer, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		
		# Room 1 - Bottom
		@doorLayer.addChild new Door 100, 500, @collisionLayer, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 500, 500, @collisionLayer, Door.COLOR_GREEN, false, Door.ORIENTATION_PORTRAIT
		
		# Room 2 - Top
		@doorLayer.addChild new Door 900, 200, @collisionLayer, Door.COLOR_GREEN, false, Door.ORIENTATION_LANDSCAPE
		
		# Room 2 - Bottom
		@doorLayer.addChild new Door 1000, 500, @collisionLayer, Door.COLOR_GREEN, false, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 1300, 500, @collisionLayer, Door.COLOR_BLUE, false, Door.ORIENTATION_PORTRAIT
		
		# Room 3 - Top
		@doorLayer.addChild new Door 1500, 200, @collisionLayer, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 1700, 200, @collisionLayer, Door.COLOR_BLUE, true, Door.ORIENTATION_LANDSCAPE
		@doorLayer.addChild new Door 1800, 200, @collisionLayer, Door.COLOR_GREEN, true, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 2000, 200, @collisionLayer, Door.COLOR_BLUE, false, Door.ORIENTATION_PORTRAIT
		
		# Room 3 - Bottom
		@doorLayer.addChild new Door 1500, 500, @collisionLayer, Door.COLOR_RED, true, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 1600, 500, @collisionLayer, Door.COLOR_BLUE, false, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 1800, 500, @collisionLayer, Door.COLOR_GREEN, false, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 1800, 400, @collisionLayer, Door.COLOR_RED, false, Door.ORIENTATION_PORTRAIT
		@doorLayer.addChild new Door 1800, 400, @collisionLayer, Door.COLOR_RED, false, Door.ORIENTATION_LANDSCAPE
		
		@addChild @doorLayer