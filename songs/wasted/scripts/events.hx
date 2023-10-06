var fog:FlxSprite;
var truefog:FlxSprite;
function postCreate() {
	fog = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/fog'));
	fog.scale.set(2, 2);
	fog.screenCenter();
	fog.scrollFactor.set(0.8, 0.8);
	fog.cameras = [camHUD];
	truefog = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/truefog'));
	truefog.scale.set(2, 2);
	truefog.screenCenter();
	truefog.scrollFactor.set(0.8, 0.8);
	insert(members.indexOf(stage.getSprite("mountains")), truefog);
	truefog.visible = false;
}
function beatHit(curBeat) {
	switch(curBeat) {
		case 129: 
			truefog.visible = true;
			add(fog);
			fog.color = 0xFF77ADFF;
			FlxG.camera.flash(0xFFFFFFFF, 1, null, true);
			dad.color = 0xFF000000;
			boyfriend.color = 0xFF000000;
			gf.color = 0xFF000000;
			stage.getSprite("mountains").color = 0xFF000000;
			stage.getSprite("hillfront").color = 0xFF000000;
			stage.getSprite("street").color = 0xFF000000;
			stage.getSprite("street").alpha = 0.5;
			stage.getSprite("hillfront").alpha = 0.25;
			stage.getSprite("mountains").alpha = 0.125;
			gf.alpha = 0.75;
		case 233:
			truefog.visible = false;
			remove(fog);
			dad.color = 
			boyfriend.color = 
			gf.color = 
			stage.getSprite("mountains").color = 
			stage.getSprite("hillfront").color = 
			stage.getSprite("street").color = 0xFFFFFFFF;
			stage.getSprite("street").alpha = 
			stage.getSprite("hillfront").alpha = 
			stage.getSprite("mountains").alpha = 
			gf.alpha = 1;
	}
}