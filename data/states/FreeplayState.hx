import flixel.graphics.FlxGraphic;
var camText:FlxCamera = new FlxCamera();
var portrait:FlxSprite;
var preload = [];
var time:Float = 0;
//i_know_this_looks_ass_but_it_works
var fish:CustomShader  = new CustomShader("fisheye");
camText.addShader(fish);
fish.data.MAX_POWER.value = [0.19];
if (FlxG.save.data.crt){ var crt:CustomShader  = new CustomShader("fake CRT");
	FlxG.camera.addShader(crt);}
if (FlxG.save.data.chrom) { var chrom:CustomShader  = new CustomShader("chromatic aberration");
	FlxG.camera.addShader(chrom);camText.addShader(chrom);
	chrom.data.rOffset.value = [1/2];
	chrom.data.gOffset.value = [0.0];
	chrom.data.bOffset.value = [1 * -1];
}
camText.bgColor = 0;
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
}
function postCreate() {
	FlxG.cameras.add(camText, false);
	grpSongs.camera = camText;
	for (i in iconArray) i.camera = camText;

	bg = new FlxSprite();
	bg.frames = Paths.getSparrowAtlas('menus/freeplay/mainbgAnimate');
	bg.animation.addByPrefix('animate', 'animate', 24, true);
	bg.animation.play('animate');
	bg.scale.set(2,2);
	bg.updateHitbox();
	bg.screenCenter();
	add(bg);


	portrait = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/portraits/ron'));
	portrait.scale.set(0.51,0.51);
	portrait.updateHitbox();
	add(portrait);
	
	var bar:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/bar'));
	add(bar);
	bar.screenCenter();
	bar.x += 30;
	for (i in songs) {
		var graphic = FlxGraphic.fromAssetKey(Paths.image('menus/freeplay/portraits/' + i.name));
		graphic.persist = true;
		preload.push(graphic);
	}
	changeSelection(0, true);
}
function onChangeSelection(event) {
	if (event.change == 0) event.playMenuSFX = false;
	FlxTween.globalManager.completeTweensOf(portrait);
	var val = event.value;
	FlxTween.tween(portrait, {y: portrait.y + 45, angle: 5}, 0.2, {ease: FlxEase.quintIn, onComplete: function(twn:FlxTween) {
		portrait.loadGraphic(preload[val]);
		portrait.updateHitbox();
		portrait.screenCenter();
		var mfwY = portrait.y;
		portrait.y -= 20;
		portrait.angle = -5;
		FlxTween.tween(portrait, {y: mfwY, angle: 0}, 0.4, {ease: FlxEase.elasticOut});
	}});
}