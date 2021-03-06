// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Orb = (function(_super) {
    __extends(Orb, _super);

    function Orb(asset) {
      this.asset = asset;
      this.initialize();
    }

    Orb.prototype.initialize = function() {
      var spriteSheet;
      Orb.__super__.initialize.apply(this, arguments);
      spriteSheet = new createjs.SpriteSheet({
        images: [this.asset],
        frames: {
          width: 35,
          height: 35
        },
        animations: {
          idle: [0, 7, "idle", 1 / 3]
        }
      });
      return this.addChild(new createjs.Sprite(spriteSheet, "idle"));
    };

    return Orb;

  })(createjs.Container);

}).call(this);
