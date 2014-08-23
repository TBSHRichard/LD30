WIDTH = 700
HEIGHT = 600

window.Main =
	run: ->
		gameCanvas = $ document.createElement "canvas"
		gameCanvas.attr "width", WIDTH
		gameCanvas.attr "height", HEIGHT
		gameCanvas.attr "id", "gameCanvas"
		gameCanvas.html "You must use a browser which supports the HTML5 Canvas."
		
		gameControls = $ document.createElement "div"
		
		gameControlsHeader = $ document.createElement "h2"
		gameControlsHeader.html "Controls"
		gameControls.append gameControlsHeader
		
		gameControlsLine = $ document.createElement "p"
		gameControlsLine.html "&larr; - Move Left"
		gameControls.append gameControlsLine
		
		gameControlsLine = $ document.createElement "p"
		gameControlsLine.html "&rarr; - Move Right"
		gameControls.append gameControlsLine
		
		gameControlsLine = $ document.createElement "p"
		gameControlsLine.html "&uarr; - Jump"
		gameControls.append gameControlsLine
		
		gameControlsLine = $ document.createElement "p"
		gameControlsLine.html "Z - Pickup/Place Orb (Top Dimension)"
		gameControls.append gameControlsLine
		
		gameControlsLine = $ document.createElement "p"
		gameControlsLine.html "X - Pickup/Place Orb (Bottom Dimension)"
		gameControls.append gameControlsLine
		
		gameControlsLine = $ document.createElement "p"
		gameControlsLine.html "R - Restart Game"
		gameControls.append gameControlsLine
		
		$("#gameContainer").html gameCanvas
		$("#gameContainer").append gameControls
		
		new Game WIDTH, HEIGHT, new PreloaderGameWindow WIDTH, HEIGHT