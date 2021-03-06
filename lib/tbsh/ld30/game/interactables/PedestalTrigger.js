// Generated by CoffeeScript 1.7.1
(function() {
  var DIMEN,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  DIMEN = 35;

  window.PedestalTrigger = (function(_super) {
    __extends(PedestalTrigger, _super);

    function PedestalTrigger(id, x, y, levelWindow, assetQueue, bitmapLayer, hintLayer) {
      this.id = id;
      this.levelWindow = levelWindow;
      this.assetQueue = assetQueue;
      this.bitmapLayer = bitmapLayer;
      this.hintLayer = hintLayer;
      PedestalTrigger.__super__.constructor.call(this, x, y, DIMEN, DIMEN, DIMEN / 2, DIMEN / 2);
      this.orbColor = null;
      this.linkedPedestal = null;
      this.linkedDoors = [];
      this.xPlace = new createjs.Bitmap(this.assetQueue.getResult("xPlace"));
      this.xPlace.alpha = 0;
      this.xPlace.x = x - 75;
      this.xPlace.y = y - 25;
      this.xPickup = new createjs.Bitmap(this.assetQueue.getResult("xPickup"));
      this.xPickup.alpha = 0;
      this.xPickup.x = x - 75;
      this.xPickup.y = y - 25;
      this.zPlace = new createjs.Bitmap(this.assetQueue.getResult("zPlace"));
      this.zPlace.alpha = 0;
      this.zPlace.x = x - 75;
      this.zPlace.y = y - 25;
      this.zPickup = new createjs.Bitmap(this.assetQueue.getResult("zPickup"));
      this.zPickup.alpha = 0;
      this.zPickup.x = x - 75;
      this.zPickup.y = y - 25;
      this.hintLayer.addChild(this.xPlace);
      this.hintLayer.addChild(this.xPickup);
      this.hintLayer.addChild(this.zPlace);
      this.hintLayer.addChild(this.zPickup);
    }

    PedestalTrigger.prototype.setLinkedPedestal = function(linkedPedestal) {
      this.linkedPedestal = linkedPedestal;
    };

    PedestalTrigger.prototype.setLinkedDoors = function(linkedDoors) {
      this.linkedDoors = linkedDoors;
    };

    PedestalTrigger.prototype.setOrbColor = function(orbColor) {
      var door, _i, _len, _ref, _results;
      this.orbColor = orbColor;
      this.addOrbBitmap();
      _ref = this.linkedDoors;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        door = _ref[_i];
        if (door.color === this.orbColor) {
          _results.push(door.toggleState());
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    PedestalTrigger.prototype.addOrbBitmap = function() {
      var asset;
      asset = (function() {
        switch (this.orbColor) {
          case Color.RED:
            return this.assetQueue.getResult("redOrb");
          case Color.GREEN:
            return this.assetQueue.getResult("greenOrb");
          case Color.BLUE:
            return this.assetQueue.getResult("blueOrb");
        }
      }).call(this);
      this.orbBitmap = new Orb(asset);
      this.orbBitmap.x = this.x;
      this.orbBitmap.y = this.y;
      this.orbBitmap.regX = DIMEN / 2;
      this.orbBitmap.regY = DIMEN / 2;
      return this.bitmapLayer.addChild(this.orbBitmap);
    };

    PedestalTrigger.prototype.removeOrb = function() {
      var door, _i, _len, _ref;
      _ref = this.linkedDoors;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        door = _ref[_i];
        if (door.color === this.orbColor) {
          door.toggleState();
        }
      }
      this.orbColor = null;
      return this.bitmapLayer.removeChild(this.orbBitmap);
    };

    PedestalTrigger.prototype.onTick = function(e, data) {
      var hintAsset, otherAsset, pickupAsset, placeAsset, player, trigger;
      PedestalTrigger.__super__.onTick.call(this, e, data);
      player = data.player;
      trigger = data.trigger;
      hintAsset = null;
      if (player.constructor.name === "TopDimensionPlayer") {
        placeAsset = trigger.zPlace;
        pickupAsset = trigger.zPickup;
      } else {
        placeAsset = trigger.xPlace;
        pickupAsset = trigger.xPickup;
      }
      if (trigger.orbColor !== null) {
        if (player.orbColor === null) {
          hintAsset = pickupAsset;
          otherAsset = placeAsset;
        } else {
          trigger.xPlace.alpha = 0;
          trigger.xPickup.alpha = 0;
          trigger.zPlace.alpha = 0;
          trigger.zPickup.alpha = 0;
        }
      } else {
        if (player.orbColor !== null) {
          hintAsset = placeAsset;
          otherAsset = pickupAsset;
        } else {
          trigger.xPlace.alpha = 0;
          trigger.xPickup.alpha = 0;
          trigger.zPlace.alpha = 0;
          trigger.zPickup.alpha = 0;
        }
      }
      if (trigger.isTriggered) {
        player.setNearbyPedestal(trigger);
        if (hintAsset !== null) {
          hintAsset.alpha = 1;
          return otherAsset.alpha = 0;
        }
      } else {
        player.removeNearbyPedestal(trigger);
        trigger.xPlace.alpha = 0;
        trigger.xPickup.alpha = 0;
        trigger.zPlace.alpha = 0;
        return trigger.zPickup.alpha = 0;
      }
    };

    return PedestalTrigger;

  })(Trigger);

}).call(this);
