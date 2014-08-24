FILENAMES = [
	"foreground"
	"pedestals"
]

WIDTH = 700
HEIGHT = 600

preWin = null

class window.PreloaderGameWindow extends GameWindow
	initialize: ->
		super
		
		preWin = this
		
		queue = new createjs.LoadQueue()
		queue.loadFile {id: "logo", src: "/ld30/img/tbsh.png"}
		queue.on "complete", @startPreload
	
	startPreload: (e) ->
		preWin.setupProgressDisplay e.target.getResult "logo"
	
	setupProgressDisplay: (logo) ->
		fadedLogo = new createjs.Bitmap logo
		fadedLogo.regX = 75
		fadedLogo.regY = 82
		fadedLogo.x = WIDTH / 2
		fadedLogo.y = HEIGHT / 2
		@addChild fadedLogo
		
		loadingText = new createjs.Text "Loading...", "20px Arial", "#000"
		loadingText.regX = loadingText.getMeasuredWidth() / 2
		loadingText.regY = loadingText.getMeasuredHeight() / 2
		loadingText.x = WIDTH / 2
		loadingText.y = HEIGHT / 2 + 100
		@addChild loadingText
		
		progressLogo = new createjs.Shape()
		logoMatrix = new createjs.Matrix2D()
		logoMatrix.translate WIDTH / 2 - 75, HEIGHT / 2 - 82
		@addChild progressLogo
		
		progressText = new createjs.Text "0%", "20px Arial", "#fff"
		progressText.regX = progressText.getMeasuredWidth() / 2
		progressText.regY = progressText.getMeasuredHeight() / 2
		progressText.x = WIDTH / 2 - 3
		progressText.y = HEIGHT / 2 + 5
		@addChild progressText
		
		Preloader.preload FILENAMES, ((e) ->
				progressLogo.graphics.clear().beginBitmapFill(logo, "no-repeat", logoMatrix).drawRect WIDTH / 2 - 75, HEIGHT / 2 - 82, 150 * e.progress, 165
				progressText.text = "#{Math.floor e.progress * 100}%"
				progressText.regX = progressText.getMeasuredWidth() / 2
			), ((e) ->
				loadedAssets = e.target
				preWin.game.setAssetQueue loadedAssets
				preWin.game.setWindow new LevelGameWindow WIDTH, HEIGHT, loadedAssets
			)