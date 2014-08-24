// Generated by CoffeeScript 1.7.1
(function() {
  var DECEL, HEIGHT, JUMP_KEY, JUMP_VELOCITY, MAX_Y_VELOCITY, MOVE_LEFT_KEY, MOVE_RIGHT_KEY, WIDTH, X_VELOCITY,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  WIDTH = 35;

  HEIGHT = 60;

  DECEL = 4;

  JUMP_VELOCITY = -35;

  MAX_Y_VELOCITY = 15;

  X_VELOCITY = 10;

  JUMP_KEY = 38;

  MOVE_LEFT_KEY = 37;

  MOVE_RIGHT_KEY = 39;

  window.Player = (function(_super) {
    __extends(Player, _super);

    function Player(collisionMap, spriteSheet, interactionKey) {
      this.collisionMap = collisionMap;
      this.spriteSheet = spriteSheet;
      this.interactionKey = interactionKey;
      this.orb = null;
      this.xVelocity = 0;
      this.yVelocity = 0;
      this.jumpIsCoolingDown = this.isMovingLeft = this.isMovingRight = false;
      this.initialize();
    }

    Player.prototype.initialize = function() {
      var player;
      Player.__super__.initialize.apply(this, arguments);
      this.graphics.beginFill("#0ff");
      this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
      player = this;
      $(document).keydown(function(e) {
        if (e.keyCode === JUMP_KEY) {
          if (!player.jumpIsCoolingDown && player.onTheGround()) {
            player.jumpIsCoolingDown = true;
            player.y -= 3;
            player.yVelocity = JUMP_VELOCITY;
          }
        }
        if (e.keyCode === MOVE_LEFT_KEY) {
          player.isMovingLeft = true;
        }
        if (e.keyCode === MOVE_RIGHT_KEY) {
          return player.isMovingRight = true;
        }
      });
      $(document).keyup(function(e) {
        if (e.keyCode === JUMP_KEY) {
          player.jumpIsCoolingDown = false;
        }
        if (e.keyCode === MOVE_LEFT_KEY) {
          player.isMovingLeft = false;
        }
        if (e.keyCode === MOVE_RIGHT_KEY) {
          return player.isMovingRight = false;
        }
      });
      return createjs.Ticker.on("tick", this.onTick, null, false, {
        player: this
      });
    };

    Player.prototype.interact = function(pedestal) {
      if (this.orb !== null) {
        pedestal.setOrb(this.orb);
        return this.orb = null;
      } else {
        this.orb = pedestal.orb;
        return pedestal.removeOrb();
      }
    };

    Player.prototype.onTheGround = function() {
      return this.collisionMap.hitTest(this.x + 2, this.y + HEIGHT) || this.collisionMap.hitTest(this.x + 2, this.y + HEIGHT - 15) || this.collisionMap.hitTest(this.x + WIDTH - 2, this.y + HEIGHT) || this.collisionMap.hitTest(this.x + WIDTH - 2, this.y + HEIGHT - 15);
    };

    Player.prototype.hitHead = function() {
      return this.yVelocity < 0 && (this.collisionMap.hitTest(this.x + 2, this.y) || this.collisionMap.hitTest(this.x + WIDTH - 2, this.y));
    };

    Player.prototype.ranLeftIntoWall = function() {
      return this.collisionMap.hitTest(this.x, this.y + HEIGHT / 2);
    };

    Player.prototype.ranRightIntoWall = function() {
      return this.collisionMap.hitTest(this.x + WIDTH - 10, this.y + HEIGHT / 2);
    };

    Player.prototype.onTick = function(e, data) {
      var player;
      player = data.player;
      if (!player.onTheGround()) {
        if (player.yVelocity < MAX_Y_VELOCITY) {
          player.yVelocity += DECEL;
        }
        if (player.hitHead()) {
          player.yVelocity *= -1;
        }
      } else {
        if (player.yVelocity > 0) {
          player.y = Math.floor(player.y / 100) * 100 + (90 - HEIGHT);
          player.yVelocity = 0;
        }
      }
      if (player.isMovingLeft) {
        player.x -= X_VELOCITY;
      }
      if (player.isMovingRight) {
        player.x += X_VELOCITY;
      }
      player.y += player.yVelocity;
      if (player.ranLeftIntoWall()) {
        player.x = Math.floor(player.x / 100) * 100 + 10;
      }
      if (player.ranRightIntoWall()) {
        return player.x = Math.floor(player.x / 100) * 100 + 100 - WIDTH;
      }
    };

    return Player;

  })(createjs.Shape);

}).call(this);