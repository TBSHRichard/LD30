class window.Trigger
	constructor: (@x, @y, @width, @height, @regX = 0, @regY = 0) ->
		@isTriggered = false
	
	watchPlayer: (player) ->
		@listener = createjs.Ticker.on "tick", @onTick, null, false, {player: player, trigger: this}
	
	unwatchPlayer: ->
		createjs.Ticker.off "tick", @listener
	
	onTick: (e, data) ->
		player = data.player
		trigger = data.trigger
		
		playerLeft = player.x + 2
		playerRight = player.x + Player.WIDTH - 2
		playerTop = player.y
		playerBottom = player.y + Player.HEIGHT
		
		triggerLeft = trigger.x - trigger.regX
		triggerRight = trigger.x + trigger.width - trigger.regX
		triggerTop = trigger.y - trigger.regY
		triggerBottom = trigger.y + trigger.height - trigger.regY
		
		trigger.isTriggered = ((playerLeft > triggerLeft and playerLeft < triggerRight) or (playerRight > triggerLeft and playerRight < triggerRight)) and
			((playerBottom > triggerTop and playerBottom < triggerBottom) or (playerTop > triggerTop and playerTop < triggerBottom))