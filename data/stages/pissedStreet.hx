//yes_i_know_how_unoptimized_this_shit_is
var fog:FlxSprite;
var truefog:FlxSprite;
var time:Float = 0;
var iTime:Float = 0;
var wasdark = false;
var ray = new CustomShader('godray');
var crt = new CustomShader('fake CRT');
var wig:CustomShader  = new CustomShader("glitchsmh");
var chrom:CustomShader  = new CustomShader("chromatic aberration");

function postCreate() {
	underwater.visible = false;

	for (i in 1...4) {
		var rainshader = new CustomShader("rain");
		rainshader.zoom = (i / 3) * 70;
		rainshader.raindropLength = 0.1 / i;
		rainshader.opacity = 0.25;
		__script__.get("rain" + i).shader = rainshader;
	}
	
	boyfriend.color = 0xFFdbcfb3;
	gf.color = 0xFFdbcfb3;
	
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

function fade()
{
	var it = 1; 
	for (i in stage.stageSprites) {
		FlxTween.color(i, (Conductor.crochet/1000) * 4.5,0xFFFFFFFF, 0xFF000000);
	}
}

function darkness()
{
	wasdark = !wasdark;
	if (wasdark == true)
	{
		for (i in stage.stageSprites) {
			FlxTween.cancelTweensOf(i, ['color']);
		}
		truefog.visible = true;
		add(fog);
		fog.color = 0xFF77ADFF;
		FlxG.camera.flash(0xFF000000, 1, null, true);
		dad.color = 0xFF000000;
		boyfriend.color = 0xFF000000;
		truefog.color = 0xFFFFFFFF;
			
		sky.color = 0xFFFFFFFF;
		city.color = 0xFFFFFFFF;
		mountains.color = 0xFF000000;
		hillfront.color = 0xFF000000;
		street.color = 0xFF000000;
		street.alpha = 0.5;
		hillfront.alpha = 0.25;
		mountains.alpha = 0.125;
			
		gf.alpha = 0.75;
		gf.color = 0xFF000000;
	}
	else
	{
		truefog.visible = false;
		remove(fog);
		var it = 0; 
		for (i in stage.stageSprites) {
			if (i.color == 0xFF000000)
				FlxTween.color(i, (Conductor.crochet/2000), 0xFF000000, 0xFFFFFFFF, {ease: FlxEase.circOut});
		}
		FlxTween.color(dad, (Conductor.crochet/2000), 0xFF000000, 0xFFFFFFFF, {ease: FlxEase.circOut});
		for (i in [gf, boyfriend])
			FlxTween.color(i, (Conductor.crochet/2000), 0xFF000000, 0xFFdbcfb3, {ease: FlxEase.circOut});

		street.alpha = hillfront.alpha = mountains.alpha = gf.alpha = 1;
	}
}

function underwater()
{
	sky.visible = !sky.visible;
	rain3.visible = !rain3.visible;
	city.visible = !city.visible;
	mountains.visible = !mountains.visible;
	hillfront.visible = !hillfront.visible;
	rain2.visible = !rain2.visible;
	street.visible = !street.visible;
	rain1.visible = !rain.visible;
	underwater.visible = !underwater.visible;
}

function update(elapsed) 
{
	time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
	for (i in 1...4) __script__.get("rain" + i).shader.iTime = Conductor.songPosition / 1000;
}