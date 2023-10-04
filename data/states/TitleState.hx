var done = false;
function update() {
	if (done != (done = true)) {
		CoolUtil.loadAnimatedGraphic(members[0], Paths.image("menus/titlescreen/trueTitleBgAnimated"));
		members[0].scale.set(2,2);
		members[0].updateHitbox();
		if (blackScreen.frames != null) {
			CoolUtil.loadAnimatedGraphic(blackScreen, Paths.image("menus/titlescreen/titleThing"));
			blackScreen.scale.set(2.25,2.25);
			blackScreen.updateHitbox();
		}
		remove(titleText);
		import flixel.addons.display.FlxBackdrop;
		var animbarScrt = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarTop'), FlxAxes.X, 0, 0);
		var animbarScrb = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarBottom'), FlxAxes.X, 0, 0);
		animbarScrb.velocity.x -= 120;
		animbarScrt.velocity.x += 120;
		insert(members.indexOf(titleScreenSprites), animbarScrb);
		insert(members.indexOf(titleScreenSprites), animbarScrt);
	}
}
function beatHit(curBeat) {
	FlxTween.completeTweensOf(FlxG.camera);
	FlxG.camera.zoom += 0.03;
	FlxTween.tween(FlxG.camera, {zoom: 1}, Conductor.crochet / 1500, {ease: FlxEase.backOut});
}