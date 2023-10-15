function beatHit(curBeat) {
	switch(curBeat) {
		case 60: var it = 0;for (i in stage.stageSprites) {
			FlxTween.color(i, (Conductor.crochet/1000) * 5/it++,0xFFFFFFFF, 0xFF000000);
		}
	}
}