class window.Trigger
	constructor: (@x, @y, @width, @height) ->
		@isTriggered = false
	
	watchPlayer: (player) ->
		createjs.Ticker.on "tick", @onTick, null, false, {player: player, trigger: this}
	
	unwatchPlayer: ->
		createjs.Ticker.off "tick", @onTick
	
	onTick: (e, data) ->
		player = data.player
		trigger = data.trigger
		
		playerLeft = player.x + 2
		playerRight = player.x + Player.WIDTH - 2
		playerTop = player.y
		playerBottom = player.y + Player.HEIGHT
		
		triggerLeft = trigger.x - trigger.width/2
		triggerRight = trigger.x + trigger.width/2
		triggerTop = trigger.y - trigger.height/2
		triggerBottom = trigger.y + trigger.height/2
		
		@isTriggered = ((playerLeft > triggerLeft and playerLeft < triggerRight) or (playerRight > triggerLeft and playerRight < triggerRight)) and
			((playerBottom > triggerTop and playerBottom < triggerBottom) or (playerTop > triggerTop and playerTop < triggerBottom))