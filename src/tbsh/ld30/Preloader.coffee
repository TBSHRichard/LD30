window.Preloader =
	preload: (filenames, onProgress, onFinished) ->
		queue = new createjs.LoadQueue true, "/ld30/img/"
		manifest = []
		
		for filename in filenames
			manifest.push {id: filename, src: "#{filename}.png"}
		
		queue.on "progress", onProgress
		queue.on "complete", onFinished
		queue.loadManifest manifest