function beatHit(curBeat) {
	switch(curBeat) {
		case 1:
			defaultCamZoom = 1;
		case 60: var it = 0;for (i in stage.stageSprites) {
			FlxTween.color(i, (Conductor.crochet/1000) * 5/(8-it++),0xFFFFFFFF, 0xFF000000);
		}
	}
}