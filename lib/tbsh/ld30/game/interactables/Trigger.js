// Generated by CoffeeScript 1.7.1
(function() {
  window.Trigger = (function() {
    function Trigger(x, y, width, height, regX, regY) {
      this.x = x;
      this.y = y;
      this.width = width;
      this.height = height;
      this.regX = regX != null ? regX : 0;
      this.regY = regY != null ? regY : 0;
      this.isTriggered = false;
    }

    Trigger.prototype.watchPlayer = function(player) {
      return this.listener = createjs.Ticker.on("tick", this.onTick, null, false, {
        player: player,
        trigger: this
      });
    };

    Trigger.prototype.unwatchPlayer = function() {
      return createjs.Ticker.off("tick", this.listener);
    };

    Trigger.prototype.onTick = function(e, data) {
      var player, playerBottom, playerLeft, playerRight, playerTop, trigger, triggerBottom, triggerLeft, triggerRight, triggerTop;
      player = data.player;
      trigger = data.trigger;
      playerLeft = player.x + 2;
      playerRight = player.x + Player.WIDTH - 2;
      playerTop = player.y;
      playerBottom = player.y + Player.HEIGHT;
      triggerLeft = trigger.x - trigger.regX;
      triggerRight = trigger.x + trigger.width - trigger.regX;
      triggerTop = trigger.y - trigger.regY;
      triggerBottom = trigger.y + trigger.height - trigger.regY;
      return trigger.isTriggered = ((playerLeft > triggerLeft && playerLeft < triggerRight) || (playerRight > triggerLeft && playerRight < triggerRight)) && ((playerBottom > triggerTop && playerBottom < triggerBottom) || (playerTop > triggerTop && playerTop < triggerBottom));
    };

    return Trigger;

  })();

}).call(this);
