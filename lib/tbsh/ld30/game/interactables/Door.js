// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Door = (function(_super) {
    __extends(Door, _super);

    function Door(x, y, levelWindow, color, isOpen, orientation, doorAsset) {
      this.x = x;
      this.y = y;
      this.levelWindow = levelWindow;
      this.color = color;
      this.isOpen = isOpen;
      this.orientation = orientation;
      this.doorAsset = doorAsset;
      this.initialize();
    }

    Door.prototype.initialize = function() {
      var spriteSheet;
      spriteSheet = new createjs.SpriteSheet({
        images: [this.doorAsset],
        frames: {
          width: 10,
          height: 90
        },
        animations: {
          open: {
            frames: [0, 1, 2, 3],
            next: false
          },
          close: {
            frames: [3, 2, 1, 0],
            next: false
          }
        }
      });
      Door.__super__.initialize.call(this, spriteSheet);
      if (this.orientation === Orientation.LANDSCAPE) {
        this.rotation = 90;
        this.scaleY = -1;
        this.rectWidth = 90;
        this.rectHeight = 10;
        this.x += 10;
        this.y -= 10;
      } else {
        this.rectWidth = 10;
        this.rectHeight = 90;
      }
      return this.resetAppearance();
    };

    Door.prototype.toggleState = function() {
      this.isOpen = !this.isOpen;
      return this.resetAppearance();
    };

    Door.prototype.resetAppearance = function() {
      if (this.isOpen) {
        return this.gotoAndPlay("open");
      } else {
        return this.gotoAndPlay("close");
      }
    };

    return Door;

  })(createjs.Sprite);

}).call(this);
