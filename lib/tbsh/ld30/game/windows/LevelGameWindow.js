// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.LevelGameWindow = (function(_super) {
    __extends(LevelGameWindow, _super);

    function LevelGameWindow(width, height, assetQueue) {
      this.assetQueue = assetQueue;
      LevelGameWindow.__super__.constructor.call(this, width, height);
    }

    LevelGameWindow.prototype.initialize = function() {
      LevelGameWindow.__super__.initialize.apply(this, arguments);
      this.levelLayer = new createjs.Container();
      this.hintLayer = new createjs.Container();
      this.doors = [];
      this.setupBackground();
      this.setupCollisionMap();
      this.setupPedestalBitmap();
      this.setupDoorLayer();
      this.drawDoorsToCollisionMap();
      this.setupPlayers();
      this.setupForeground();
      this.setupTriggers();
      this.levelLayer.addChild(this.hintLayer);
      return this.addChild(this.levelLayer);
    };

    LevelGameWindow.prototype.setupBackground = function() {
      var overlayShape;
      this.backgroundLayer = new createjs.Container();
      this.backgroundLayer.addChild(new createjs.Bitmap(this.assetQueue.getResult("background")));
      overlayShape = new createjs.Shape();
      overlayShape.graphics.beginFill("#000");
      overlayShape.graphics.drawRect(0, 0, 2100, 600);
      overlayShape.alpha = 0.5;
      this.backgroundLayer.addChild(overlayShape);
      return this.levelLayer.addChild(this.backgroundLayer);
    };

    LevelGameWindow.prototype.setupCollisionMap = function() {
      var shape;
      shape = new createjs.Shape();
      this.collisionMap = shape;
      this.collisionMap.alpha = 0;
      return this.levelLayer.addChild(this.collisionMap);
    };

    LevelGameWindow.prototype.drawBaseCollisionMap = function(g) {
      g.beginFill("#000");
      g.moveTo(1010.0, 190.0);
      g.lineTo(1000.0, 190.0);
      g.lineTo(1000.0, 100.0);
      g.lineTo(1010.0, 100.0);
      g.lineTo(1010.0, 190.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1000.0, 200.0);
      g.lineTo(1070.0, 200.0);
      g.lineTo(1070.0, 190.0);
      g.lineTo(1000.0, 190.0);
      g.lineTo(1000.0, 200.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1000.0, 90.0);
      g.lineTo(1000.0, 100.0);
      g.lineTo(1110.0, 100.0);
      g.lineTo(1110.0, 90.0);
      g.lineTo(1000.0, 90.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1610.0, 500.0);
      g.lineTo(1500.0, 500.0);
      g.lineTo(1500.0, 490.0);
      g.lineTo(1610.0, 490.0);
      g.lineTo(1610.0, 500.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(400.0, 90.0);
      g.lineTo(400.0, 100.0);
      g.lineTo(510.0, 100.0);
      g.lineTo(510.0, 90.0);
      g.lineTo(400.0, 90.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(2090.0, 0.0);
      g.lineTo(2090.0, 0.0);
      g.lineTo(10.0, 0.0);
      g.lineTo(10.0, 0.0);
      g.lineTo(0.0, 0.0);
      g.lineTo(0.0, 0.0);
      g.lineTo(0.0, 10.0);
      g.lineTo(0.0, 290.0);
      g.lineTo(0.0, 300.0);
      g.lineTo(0.0, 310.0);
      g.lineTo(0.0, 590.0);
      g.lineTo(0.0, 600.0);
      g.lineTo(10.0, 600.0);
      g.lineTo(2100.0, 600.0);
      g.lineTo(2100.0, 590.0);
      g.lineTo(310.0, 590.0);
      g.lineTo(310.0, 500.0);
      g.lineTo(510.0, 500.0);
      g.lineTo(510.0, 490.0);
      g.lineTo(300.0, 490.0);
      g.lineTo(300.0, 500.0);
      g.lineTo(300.0, 590.0);
      g.lineTo(10.0, 590.0);
      g.lineTo(10.0, 310.0);
      g.lineTo(100.0, 310.0);
      g.lineTo(100.0, 500.0);
      g.lineTo(110.0, 500.0);
      g.lineTo(210.0, 500.0);
      g.lineTo(210.0, 490.0);
      g.lineTo(210.0, 400.0);
      g.lineTo(210.0, 390.0);
      g.lineTo(110.0, 390.0);
      g.lineTo(110.0, 310.0);
      g.lineTo(690.0, 310.0);
      g.lineTo(690.0, 500.0);
      g.lineTo(700.0, 500.0);
      g.lineTo(710.0, 500.0);
      g.lineTo(710.0, 310.0);
      g.lineTo(1000.0, 310.0);
      g.lineTo(1000.0, 500.0);
      g.lineTo(1010.0, 500.0);
      g.lineTo(1110.0, 500.0);
      g.lineTo(1110.0, 490.0);
      g.lineTo(1110.0, 400.0);
      g.lineTo(1110.0, 390.0);
      g.lineTo(1010.0, 390.0);
      g.lineTo(1010.0, 400.0);
      g.lineTo(1100.0, 400.0);
      g.lineTo(1100.0, 490.0);
      g.lineTo(1010.0, 490.0);
      g.lineTo(1010.0, 310.0);
      g.lineTo(1390.0, 310.0);
      g.lineTo(1390.0, 490.0);
      g.lineTo(1300.0, 490.0);
      g.lineTo(1300.0, 500.0);
      g.lineTo(1390.0, 500.0);
      g.lineTo(1400.0, 500.0);
      g.lineTo(1410.0, 500.0);
      g.lineTo(1410.0, 310.0);
      g.lineTo(1800.0, 310.0);
      g.lineTo(1800.0, 400.0);
      g.lineTo(1810.0, 400.0);
      g.lineTo(1810.0, 310.0);
      g.lineTo(2090.0, 310.0);
      g.lineTo(2090.0, 490.0);
      g.lineTo(2010.0, 490.0);
      g.lineTo(2010.0, 390.0);
      g.lineTo(2000.0, 390.0);
      g.lineTo(1910.0, 390.0);
      g.lineTo(1900.0, 390.0);
      g.lineTo(1900.0, 490.0);
      g.lineTo(1800.0, 490.0);
      g.lineTo(1800.0, 500.0);
      g.lineTo(1900.0, 500.0);
      g.lineTo(1910.0, 500.0);
      g.lineTo(1910.0, 400.0);
      g.lineTo(2000.0, 400.0);
      g.lineTo(2000.0, 490.0);
      g.lineTo(2000.0, 500.0);
      g.lineTo(2090.0, 500.0);
      g.lineTo(2100.0, 500.0);
      g.lineTo(2100.0, 310.0);
      g.lineTo(2100.0, 300.0);
      g.lineTo(2100.0, 290.0);
      g.lineTo(910.0, 290.0);
      g.lineTo(910.0, 190.0);
      g.lineTo(900.0, 190.0);
      g.lineTo(900.0, 290.0);
      g.lineTo(410.0, 290.0);
      g.lineTo(410.0, 200.0);
      g.lineTo(510.0, 200.0);
      g.lineTo(510.0, 190.0);
      g.lineTo(300.0, 190.0);
      g.lineTo(300.0, 200.0);
      g.lineTo(300.0, 290.0);
      g.lineTo(10.0, 290.0);
      g.lineTo(10.0, 10.0);
      g.lineTo(200.0, 10.0);
      g.lineTo(200.0, 90.0);
      g.lineTo(100.0, 90.0);
      g.lineTo(100.0, 100.0);
      g.lineTo(200.0, 100.0);
      g.lineTo(200.0, 190.0);
      g.lineTo(100.0, 190.0);
      g.lineTo(100.0, 200.0);
      g.lineTo(200.0, 200.0);
      g.lineTo(210.0, 200.0);
      g.lineTo(210.0, 10.0);
      g.lineTo(690.0, 10.0);
      g.lineTo(690.0, 200.0);
      g.lineTo(700.0, 200.0);
      g.lineTo(700.0, 200.0);
      g.lineTo(710.0, 200.0);
      g.lineTo(710.0, 10.0);
      g.lineTo(1390.0, 10.0);
      g.lineTo(1390.0, 200.0);
      g.lineTo(1400.0, 200.0);
      g.lineTo(1410.0, 200.0);
      g.lineTo(1410.0, 10.0);
      g.lineTo(1600.0, 10.0);
      g.lineTo(1600.0, 200.0);
      g.lineTo(1610.0, 200.0);
      g.lineTo(1610.0, 10.0);
      g.lineTo(2090.0, 10.0);
      g.lineTo(2090.0, 90.0);
      g.lineTo(2010.0, 90.0);
      g.lineTo(2000.0, 90.0);
      g.lineTo(2000.0, 190.0);
      g.lineTo(1810.0, 190.0);
      g.lineTo(1810.0, 100.0);
      g.lineTo(1910.0, 100.0);
      g.lineTo(1910.0, 90.0);
      g.lineTo(1810.0, 90.0);
      g.lineTo(1800.0, 90.0);
      g.lineTo(1800.0, 190.0);
      g.lineTo(1800.0, 200.0);
      g.lineTo(2090.0, 200.0);
      g.lineTo(2090.0, 200.0);
      g.lineTo(2100.0, 200.0);
      g.lineTo(2100.0, 10.0);
      g.lineTo(2100.0, 0.0);
      g.lineTo(2100.0, 0.0);
      g.lineTo(2090.0, 0.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(200.0, 400.0);
      g.lineTo(200.0, 490.0);
      g.lineTo(110.0, 490.0);
      g.lineTo(110.0, 400.0);
      g.lineTo(200.0, 400.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(310.0, 200.0);
      g.lineTo(400.0, 200.0);
      g.lineTo(400.0, 290.0);
      g.lineTo(310.0, 290.0);
      g.lineTo(310.0, 200.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(2090.0, 190.0);
      g.lineTo(2010.0, 190.0);
      g.lineTo(2010.0, 100.0);
      g.lineTo(2090.0, 100.0);
      g.lineTo(2090.0, 190.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(690.0, 200.0);
      g.lineTo(700.0, 200.0);
      g.lineTo(700.0, 290.0);
      g.lineTo(690.0, 290.0);
      g.lineTo(690.0, 200.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(700.0, 200.0);
      g.lineTo(710.0, 200.0);
      g.lineTo(710.0, 290.0);
      g.lineTo(700.0, 290.0);
      g.lineTo(700.0, 200.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1390.0, 200.0);
      g.lineTo(1400.0, 200.0);
      g.lineTo(1400.0, 290.0);
      g.lineTo(1390.0, 290.0);
      g.lineTo(1390.0, 200.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1400.0, 200.0);
      g.lineTo(1410.0, 200.0);
      g.lineTo(1410.0, 290.0);
      g.lineTo(1400.0, 290.0);
      g.lineTo(1400.0, 200.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(2090.0, 200.0);
      g.lineTo(2100.0, 200.0);
      g.lineTo(2100.0, 290.0);
      g.lineTo(2090.0, 290.0);
      g.lineTo(2090.0, 200.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(690.0, 500.0);
      g.lineTo(700.0, 500.0);
      g.lineTo(700.0, 590.0);
      g.lineTo(690.0, 590.0);
      g.lineTo(690.0, 500.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(700.0, 500.0);
      g.lineTo(710.0, 500.0);
      g.lineTo(710.0, 590.0);
      g.lineTo(700.0, 590.0);
      g.lineTo(700.0, 500.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1390.0, 500.0);
      g.lineTo(1400.0, 500.0);
      g.lineTo(1400.0, 590.0);
      g.lineTo(1390.0, 590.0);
      g.lineTo(1390.0, 500.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1400.0, 500.0);
      g.lineTo(1410.0, 500.0);
      g.lineTo(1410.0, 590.0);
      g.lineTo(1400.0, 590.0);
      g.lineTo(1400.0, 500.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(2090.0, 500.0);
      g.lineTo(2100.0, 500.0);
      g.lineTo(2100.0, 590.0);
      g.lineTo(2090.0, 590.0);
      g.lineTo(2090.0, 500.0);
      g.endFill();
      g.beginFill("#000");
      g.moveTo(1200.0, 490.0);
      g.lineTo(1300.0, 490.0);
      g.lineTo(1300.0, 500.0);
      g.lineTo(1200.0, 500.0);
      return g.lineTo(1200.0, 490.0);
    };

    LevelGameWindow.prototype.drawDoorsToCollisionMap = function() {
      var door, _i, _len, _ref, _results;
      this.collisionMap.graphics.clear();
      this.drawBaseCollisionMap(this.collisionMap.graphics);
      _ref = this.doors;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        door = _ref[_i];
        if (!door.isOpen) {
          this.collisionMap.graphics.beginFill("#000");
          this.collisionMap.graphics.drawRect(door.x, door.y, door.rectWidth, door.rectHeight);
          _results.push(this.collisionMap.graphics.endFill());
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    LevelGameWindow.prototype.setupPedestalBitmap = function() {
      var overlayShape;
      this.pedestalBitmapLayer = new createjs.Container();
      this.pedestalBitmapLayer.addChild(new createjs.Bitmap(this.assetQueue.getResult("pedestals")));
      this.levelLayer.addChild(this.pedestalBitmapLayer);
      overlayShape = new createjs.Shape();
      overlayShape.graphics.beginFill("#000");
      overlayShape.graphics.drawRect(0, 0, 2100, 600);
      overlayShape.alpha = 0.1;
      return this.levelLayer.addChild(overlayShape);
    };

    LevelGameWindow.prototype.setupDoorLayer = function() {
      var blueDoorBottom, redDoorTop;
      this.doorLayer = new createjs.Container();
      this.pedestal1ADoors = [];
      this.pedestal1BDoors = [];
      this.pedestal1CDoors = [];
      this.pedestal1EDoors = [];
      this.pedestal1GDoors = [];
      this.pedestal1JDoors = [];
      this.pedestal2ADoors = [];
      this.pedestal2DDoors = [];
      this.pedestal2FDoors = [];
      this.pedestal3ADoors = [];
      this.pedestal3BDoors = [];
      this.pedestal3CDoors = [];
      this.pedestal3EDoors = [];
      this.pedestal3FDoors = [];
      this.pedestal3GDoors = [];
      this.pedestal3HDoors = [];
      this.pedestal3IDoors = [];
      this.pedestal1ADoors.push(this.addDoorToLayer(new Door(100, 100, this, Color.GREEN, true, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopGreen"))));
      this.pedestal1BDoors.push(this.addDoorToLayer(new Door(200, 200, this, Color.RED, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopRed"))));
      this.pedestal1CDoors.push(this.addDoorToLayer(new Door(400, 100, this, Color.GREEN, true, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopGreen"))));
      this.pedestal1CDoors.push(this.addDoorToLayer(new Door(500, 100, this, Color.GREEN, true, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopGreen"))));
      this.pedestal1EDoors.push(this.addDoorToLayer(new Door(500, 200, this, Color.GREEN, true, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopGreen"))));
      this.pedestal1GDoors.push(this.addDoorToLayer(new Door(100, 500, this, Color.RED, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomRed"))));
      this.pedestal1JDoors.push(this.addDoorToLayer(new Door(500, 500, this, Color.GREEN, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomGreen"))));
      this.pedestal2ADoors.push(this.addDoorToLayer(new Door(900, 200, this, Color.GREEN, false, Orientation.LANDSCAPE, this.assetQueue.getResult("doorTopGreen"))));
      this.pedestal2DDoors.push(this.addDoorToLayer(new Door(1000, 500, this, Color.GREEN, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomGreen"))));
      this.pedestal2FDoors.push(this.addDoorToLayer(new Door(1200, 500, this, Color.BLUE, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomBlue"))));
      redDoorTop = this.addDoorToLayer(new Door(1600, 200, this, Color.RED, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopRed")));
      this.pedestal3ADoors.push(redDoorTop);
      this.pedestal3BDoors.push(redDoorTop);
      this.pedestal3CDoors.push(this.addDoorToLayer(new Door(1700, 200, this, Color.BLUE, true, Orientation.LANDSCAPE, this.assetQueue.getResult("doorTopBlue"))));
      this.pedestal3CDoors.push(this.addDoorToLayer(new Door(1800, 200, this, Color.GREEN, true, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopGreen"))));
      this.pedestal3EDoors.push(this.addDoorToLayer(new Door(2000, 200, this, Color.BLUE, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorTopBlue"))));
      this.pedestal3FDoors.push(this.addDoorToLayer(new Door(1500, 500, this, Color.RED, true, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomRed"))));
      blueDoorBottom = this.addDoorToLayer(new Door(1600, 500, this, Color.BLUE, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomBlue")));
      this.pedestal3FDoors.push(blueDoorBottom);
      this.pedestal3GDoors.push(blueDoorBottom);
      this.pedestal3HDoors.push(this.addDoorToLayer(new Door(1800, 500, this, Color.GREEN, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomGreen"))));
      this.pedestal3IDoors.push(this.addDoorToLayer(new Door(1800, 400, this, Color.RED, false, Orientation.PORTRAIT, this.assetQueue.getResult("doorBottomRed"))));
      this.pedestal3IDoors.push(this.addDoorToLayer(new Door(1800, 400, this, Color.RED, false, Orientation.LANDSCAPE, this.assetQueue.getResult("doorBottomRed"))));
      return this.levelLayer.addChild(this.doorLayer);
    };

    LevelGameWindow.prototype.addDoorToLayer = function(door) {
      this.doorLayer.addChild(door);
      this.doors.push(door);
      return door;
    };

    LevelGameWindow.prototype.setupPlayers = function() {
      this.topPlayer = new TopDimensionPlayer(this, this.collisionMap, this.assetQueue);
      this.topPlayer.x = 25;
      this.topPlayer.y = 220;
      this.bottomPlayer = new BottomDimensionPlayer(this, this.collisionMap, this.assetQueue);
      this.bottomPlayer.x = 25;
      this.bottomPlayer.y = 520;
      this.levelLayer.addChild(this.topPlayer);
      return this.levelLayer.addChild(this.bottomPlayer);
    };

    LevelGameWindow.prototype.setupForeground = function() {
      return this.levelLayer.addChild(new createjs.Bitmap(this.assetQueue.getResult("foreground")));
    };

    LevelGameWindow.prototype.setupTriggers = function() {
      var bottomRoomTrigger, pedestal1A, pedestal1B, pedestal1C, pedestal1D, pedestal1E, pedestal1F, pedestal1G, pedestal1H, pedestal1I, pedestal1J, pedestal2A, pedestal2B, pedestal2C, pedestal2D, pedestal2E, pedestal2F, pedestal3A, pedestal3B, pedestal3C, pedestal3D, pedestal3E, pedestal3F, pedestal3G, pedestal3H, pedestal3I, pedestal3J, topRoomTrigger;
      this.room1TopTriggers = [];
      this.room1BottomTriggers = [];
      this.room2TopTriggers = [];
      this.room2BottomTriggers = [];
      this.room3TopTriggers = [];
      this.room3BottomTriggers = [];
      topRoomTrigger = new TopRoomTrigger(684, 200, Direction.RIGHT, this.unwatchTriggersInRoom1, this.watchTriggersInRoom2, this, this.topPlayer);
      this.room1TopTriggers.push(topRoomTrigger);
      bottomRoomTrigger = new RoomTrigger(684, 500, Direction.RIGHT, this.unwatchTriggersInRoom1, this.watchTriggersInRoom2, this, this.bottomPlayer);
      this.room1BottomTriggers.push(bottomRoomTrigger);
      topRoomTrigger.setLinkedTrigger(bottomRoomTrigger);
      bottomRoomTrigger.setLinkedTrigger(topRoomTrigger);
      pedestal1A = new PedestalTrigger("1A", 150, 125, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal1A.setLinkedDoors(this.pedestal1ADoors);
      this.room1TopTriggers.push(pedestal1A);
      pedestal1F = new PedestalTrigger("1F", 150, 425, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room1BottomTriggers.push(pedestal1F);
      pedestal1A.setLinkedPedestal(pedestal1F);
      pedestal1F.setLinkedPedestal(pedestal1A);
      pedestal1A.setOrbColor(Color.RED);
      pedestal1F.setOrbColor(Color.RED);
      pedestal1B = new PedestalTrigger("1B", 150, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal1B.setLinkedDoors(this.pedestal1BDoors);
      this.room1TopTriggers.push(pedestal1B);
      pedestal1G = new PedestalTrigger("1G", 150, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal1G.setLinkedDoors(this.pedestal1GDoors);
      this.room1BottomTriggers.push(pedestal1G);
      pedestal1B.setLinkedPedestal(pedestal1G);
      pedestal1G.setLinkedPedestal(pedestal1B);
      pedestal1C = new PedestalTrigger("1C", 450, 125, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal1C.setLinkedDoors(this.pedestal1CDoors);
      this.room1TopTriggers.push(pedestal1C);
      pedestal1H = new PedestalTrigger("1H", 450, 425, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room1BottomTriggers.push(pedestal1H);
      pedestal1C.setLinkedPedestal(pedestal1H);
      pedestal1H.setLinkedPedestal(pedestal1C);
      pedestal1D = new PedestalTrigger("1D", 350, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room1TopTriggers.push(pedestal1D);
      pedestal1I = new PedestalTrigger("1I", 350, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room1BottomTriggers.push(pedestal1I);
      pedestal1D.setLinkedPedestal(pedestal1I);
      pedestal1I.setLinkedPedestal(pedestal1D);
      pedestal1D.setOrbColor(Color.BLUE);
      pedestal1I.setOrbColor(Color.BLUE);
      pedestal1E = new PedestalTrigger("1E", 450, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal1E.setLinkedDoors(this.pedestal1EDoors);
      this.room1TopTriggers.push(pedestal1E);
      pedestal1J = new PedestalTrigger("1J", 450, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal1J.setLinkedDoors(this.pedestal1JDoors);
      this.room1BottomTriggers.push(pedestal1J);
      pedestal1E.setLinkedPedestal(pedestal1J);
      pedestal1J.setLinkedPedestal(pedestal1E);
      topRoomTrigger = new TopRoomTrigger(708, 200, Direction.LEFT, this.unwatchTriggersInRoom2, this.watchTriggersInRoom1, this, this.topPlayer);
      this.room2TopTriggers.push(topRoomTrigger);
      bottomRoomTrigger = new RoomTrigger(708, 500, Direction.LEFT, this.unwatchTriggersInRoom2, this.watchTriggersInRoom1, this, this.bottomPlayer);
      this.room2BottomTriggers.push(bottomRoomTrigger);
      topRoomTrigger.setLinkedTrigger(bottomRoomTrigger);
      bottomRoomTrigger.setLinkedTrigger(topRoomTrigger);
      topRoomTrigger = new TopRoomTrigger(1384, 200, Direction.RIGHT, this.unwatchTriggersInRoom2, this.watchTriggersInRoom3, this, this.topPlayer);
      this.room2TopTriggers.push(topRoomTrigger);
      bottomRoomTrigger = new RoomTrigger(1384, 500, Direction.RIGHT, this.unwatchTriggersInRoom2, this.watchTriggersInRoom3, this, this.bottomPlayer);
      this.room2BottomTriggers.push(bottomRoomTrigger);
      topRoomTrigger.setLinkedTrigger(bottomRoomTrigger);
      bottomRoomTrigger.setLinkedTrigger(topRoomTrigger);
      pedestal2A = new PedestalTrigger("2A", 950, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal2A.setLinkedDoors(this.pedestal2ADoors);
      this.room2TopTriggers.push(pedestal2A);
      pedestal2D = new PedestalTrigger("2D", 950, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal2D.setLinkedDoors(this.pedestal2DDoors);
      this.room2BottomTriggers.push(pedestal2D);
      pedestal2A.setLinkedPedestal(pedestal2D);
      pedestal2D.setLinkedPedestal(pedestal2A);
      pedestal2B = new PedestalTrigger("2B", 1050, 125, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room2TopTriggers.push(pedestal2B);
      pedestal2E = new PedestalTrigger("2E", 1050, 425, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room2BottomTriggers.push(pedestal2E);
      pedestal2B.setLinkedPedestal(pedestal2E);
      pedestal2E.setLinkedPedestal(pedestal2B);
      pedestal2B.setOrbColor(Color.GREEN);
      pedestal2E.setOrbColor(Color.GREEN);
      pedestal2C = new PedestalTrigger("2C", 1250, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room2TopTriggers.push(pedestal2C);
      pedestal2F = new PedestalTrigger("2F", 1250, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal2F.setLinkedDoors(this.pedestal2FDoors);
      this.room2BottomTriggers.push(pedestal2F);
      pedestal2C.setLinkedPedestal(pedestal2F);
      pedestal2F.setLinkedPedestal(pedestal2C);
      topRoomTrigger = new TopRoomTrigger(1408, 200, Direction.LEFT, this.unwatchTriggersInRoom3, this.watchTriggersInRoom2, this, this.topPlayer);
      this.room3TopTriggers.push(topRoomTrigger);
      bottomRoomTrigger = new RoomTrigger(1408, 500, Direction.LEFT, this.unwatchTriggersInRoom3, this.watchTriggersInRoom2, this, this.bottomPlayer);
      this.room3BottomTriggers.push(bottomRoomTrigger);
      topRoomTrigger.setLinkedTrigger(bottomRoomTrigger);
      bottomRoomTrigger.setLinkedTrigger(topRoomTrigger);
      topRoomTrigger = new TopRoomTrigger(2084, 200, Direction.RIGHT, this.unwatchTriggersInRoom3, this.finish, this, this.topPlayer);
      this.room3TopTriggers.push(topRoomTrigger);
      bottomRoomTrigger = new RoomTrigger(2084, 500, Direction.RIGHT, this.unwatchTriggersInRoom3, this.finish, this, this.bottomPlayer);
      this.room3BottomTriggers.push(bottomRoomTrigger);
      topRoomTrigger.setLinkedTrigger(bottomRoomTrigger);
      bottomRoomTrigger.setLinkedTrigger(topRoomTrigger);
      pedestal3A = new PedestalTrigger("3A", 1550, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3A.setLinkedDoors(this.pedestal3ADoors);
      this.room3TopTriggers.push(pedestal3A);
      pedestal3F = new PedestalTrigger("3F", 1550, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3F.setLinkedDoors(this.pedestal3FDoors);
      this.room3BottomTriggers.push(pedestal3F);
      pedestal3A.setLinkedPedestal(pedestal3F);
      pedestal3F.setLinkedPedestal(pedestal3A);
      pedestal3B = new PedestalTrigger("3B", 1650, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3B.setLinkedDoors(this.pedestal3BDoors);
      this.room3TopTriggers.push(pedestal3B);
      pedestal3G = new PedestalTrigger("3G", 1650, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3G.setLinkedDoors(this.pedestal3GDoors);
      this.room3BottomTriggers.push(pedestal3G);
      pedestal3B.setLinkedPedestal(pedestal3G);
      pedestal3G.setLinkedPedestal(pedestal3B);
      pedestal3C = new PedestalTrigger("3C", 1750, 225, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3C.setLinkedDoors(this.pedestal3CDoors);
      this.room3TopTriggers.push(pedestal3C);
      pedestal3H = new PedestalTrigger("3H", 1750, 525, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3H.setLinkedDoors(this.pedestal3HDoors);
      this.room3BottomTriggers.push(pedestal3H);
      pedestal3C.setLinkedPedestal(pedestal3H);
      pedestal3H.setLinkedPedestal(pedestal3C);
      pedestal3D = new PedestalTrigger("3D", 1850, 125, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room3TopTriggers.push(pedestal3D);
      pedestal3I = new PedestalTrigger("3I", 1850, 425, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3I.setLinkedDoors(this.pedestal3IDoors);
      this.room3BottomTriggers.push(pedestal3I);
      pedestal3D.setLinkedPedestal(pedestal3I);
      pedestal3I.setLinkedPedestal(pedestal3D);
      pedestal3E = new PedestalTrigger("3E", 2050, 125, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      pedestal3E.setLinkedDoors(this.pedestal3EDoors);
      this.room3TopTriggers.push(pedestal3E);
      pedestal3J = new PedestalTrigger("3J", 2050, 425, this, this.assetQueue, this.pedestalBitmapLayer, this.hintLayer);
      this.room3BottomTriggers.push(pedestal3J);
      pedestal3E.setLinkedPedestal(pedestal3J);
      pedestal3J.setLinkedPedestal(pedestal3E);
      return this.watchTriggersInRoom1(this);
    };

    LevelGameWindow.prototype.watchTriggersInRoom1 = function(levelWindow) {
      var trigger, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = levelWindow.room1TopTriggers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        trigger = _ref[_i];
        trigger.watchPlayer(levelWindow.topPlayer);
      }
      _ref1 = levelWindow.room1BottomTriggers;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        trigger = _ref1[_j];
        _results.push(trigger.watchPlayer(levelWindow.bottomPlayer));
      }
      return _results;
    };

    LevelGameWindow.prototype.unwatchTriggersInRoom1 = function(levelWindow) {
      var trigger, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = levelWindow.room1TopTriggers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        trigger = _ref[_i];
        trigger.unwatchPlayer();
      }
      _ref1 = levelWindow.room1BottomTriggers;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        trigger = _ref1[_j];
        _results.push(trigger.unwatchPlayer());
      }
      return _results;
    };

    LevelGameWindow.prototype.watchTriggersInRoom2 = function(levelWindow) {
      var trigger, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = levelWindow.room2TopTriggers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        trigger = _ref[_i];
        trigger.watchPlayer(levelWindow.topPlayer);
      }
      _ref1 = levelWindow.room2BottomTriggers;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        trigger = _ref1[_j];
        _results.push(trigger.watchPlayer(levelWindow.bottomPlayer));
      }
      return _results;
    };

    LevelGameWindow.prototype.unwatchTriggersInRoom2 = function(levelWindow) {
      var trigger, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = levelWindow.room2TopTriggers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        trigger = _ref[_i];
        trigger.unwatchPlayer();
      }
      _ref1 = levelWindow.room2BottomTriggers;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        trigger = _ref1[_j];
        _results.push(trigger.unwatchPlayer());
      }
      return _results;
    };

    LevelGameWindow.prototype.watchTriggersInRoom3 = function(levelWindow) {
      var trigger, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = levelWindow.room3TopTriggers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        trigger = _ref[_i];
        trigger.watchPlayer(levelWindow.topPlayer);
      }
      _ref1 = levelWindow.room3BottomTriggers;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        trigger = _ref1[_j];
        _results.push(trigger.watchPlayer(levelWindow.bottomPlayer));
      }
      return _results;
    };

    LevelGameWindow.prototype.unwatchTriggersInRoom3 = function(levelWindow) {
      var trigger, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = levelWindow.room3TopTriggers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        trigger = _ref[_i];
        trigger.unwatchPlayer();
      }
      _ref1 = levelWindow.room3BottomTriggers;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        trigger = _ref1[_j];
        _results.push(trigger.unwatchPlayer());
      }
      return _results;
    };

    LevelGameWindow.prototype.finish = function(levelWindow) {
      return levelWindow.game.setWindow();
    };

    return LevelGameWindow;

  })(GameWindow);

}).call(this);
