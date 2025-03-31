//import
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.graphics.FlxGraphic;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.text.FlxTextAlign;
import funkin.backend.chart.Chart;

//shaders
var time:Float = 0;
var crt:CustomShader  = new CustomShader("fake CRT");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var fish:CustomShader  = new CustomShader("fisheye");
var wig:CustomShader  = new CustomShader("glitchsmh");
var grey:CustomShader  = new CustomShader("grayscale");
trace(FlxG.save.data.freeplaything);

	songs = [];
	songRealList = [
		["ron", "wasted", "ayo", "bloodshed", "trojan-virus"],
		["ron-classic", "wasted-classic", "ayo-classic", "bloodshed-classic", "trojan-virus-classic", "bleeding-classic"],
		["Tutorial", "bloodbath", "official-debate", "gron", "difficult-powers", "bijuu", "holy-shit-dave-fnf", "slammed", "ron-dsides", "lights-down-remix", "pretty-wacky", "certified-champion", "rong-aisle", "bloodshed-legacy-redux", "clusterfunk", "awesome-ron", "oh-my-god-hes-ballin", "fardventure", "bleeding"]
	];
	rsongsFound = songRealList[FlxG.save.data.freeplaything];
	
	trace(rsongsFound);
	for(s in rsongsFound)
		songs.push(Chart.loadChartMeta(s, "hard", true));

//cam
var camWhat:FlxCamera;
var camText:FlxCamera = new FlxCamera();
camText.bgColor = null;
camWhat = new FlxCamera();
FlxG.cameras.reset(camWhat);
FlxCamera.defaultCameras = [camWhat];
var portrait:FlxSprite;
var preload = [];
var particles:FlxTypedEmitter;
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
for (i in 0...songs.length)
	{
		grpSongs.members[i].y += (Math.sin(i+time)/2);
	}
}
function shadering() 
{
	var curSong = songs[curSelected].displayName;
	switch(curSong)
	{
		case "gron":{ if (FlxG.save.data.grey){FlxG.camera.addShader(grey);camText.addShader(grey);}}
		case "trojan-virus" | "Bleeding":{ if (FlxG.save.data.glitch){FlxG.camera.addShader(wig);
		wig.data.iTime.value = [2,2];wig.data.on.value = [1.];}}
		default:{FlxG.camera.removeShader(grey);camText.removeShader(grey);FlxG.camera.removeShader(wig);
		wig.data.iTime.value = [2,2];wig.data.on.value = [0];}	
	}
	diffText.color = switch(diffText.text)
	{
		case 'COOL':0xE00020;
		default: 0xFFFFFFFF;		
	}
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
	
	scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
	scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "RIGHT");

	scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 1, 0xFF000000);
	scoreBG.alpha = 0.3;
	add(scoreBG);

	diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
	diffText.font = scoreText.font;
	add(diffText);

	add(scoreText);

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
	{
		if (FlxG.save.data.crt){FlxG.camera.addShader(crt);}
		if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camText.addShader(chrom);
			chrom.data.rOffset.value = [1/2];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [1 * -1];
		}
			camText.addShader(fish);
			fish.data.MAX_POWER.value = [0.19];
		}
	var coolemitter:FlxTypedEmitter = new FlxTypedEmitter();
	coolemitter.width = FlxG.width*1.5;
	coolemitter.velocity.set(0, -5, 0, -10);
	coolemitter.angularVelocity.set(-10, 10);
	coolemitter.lifespan.set(5);
	coolemitter.y = FlxG.height;

	var coolzemitter:FlxTypedEmitter = new FlxTypedEmitter();
	coolzemitter.width = FlxG.width*1.5;
	coolzemitter.velocity.set(0, 5, 0, 10);
	coolzemitter.angularVelocity.set(-10, 10);
	coolzemitter.lifespan.set(5);

	for (i in 0...150)
	{
		var p = new FlxParticle();
		var p2 = new FlxParticle();
		p.makeGraphic(6,6,FlxColor.BLACK);
		p2.makeGraphic(12,12,FlxColor.BLACK);

		coolemitter.add(p);
		coolemitter.add(p2);
		coolzemitter.add(p);
		coolzemitter.add(p2);
	}

	add(coolzemitter);
	coolzemitter.start(false, 0.05);
	add(coolemitter);
	coolemitter.start(false, 0.05);
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
		shadering();
	}});
}