import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.display.FlxBackdrop;
importScript("data/scripts/bloodbleed-shit");
var exploders:FlxSprite = new FlxSprite();
var time:Float = 0;
var iTime:Float = 0;
var wastedGrp:FlxTypedGroup<FlxSprite> = [];
var bloodshedGrp:FlxTypedGroup<FlxSprite> = [];
var snowemitter:FlxTypedEmitter = new FlxTypedEmitter(9999, 0, 300);
snowemitter.width = FlxG.width*1.5;
snowemitter.velocity.set(-10, -240, 10, -320);
snowemitter.lifespan.set(5);
snowemitter.y = FlxG.height;
//snowemitter.acceleration.set(-10, 1600, 10, 2200);
snowemitter.acceleration.set(-10, 1900, 10, 2200);

for (i in 0...150)
{
    var p = new FlxParticle();
    var p2 = new FlxParticle();
    var p3 = new FlxParticle();
    p.makeGraphic(12,16,FlxColor.BLACK);
    p2.makeGraphic(8,12,FlxColor.BLACK);
    p3.makeGraphic(16,20,FlxColor.BLACK);

    snowemitter.add(p);
    snowemitter.add(p2);
    snowemitter.add(p3);
}
var chrom:CustomShader  = new CustomShader("chromatic aberration");
//var bloodshedTrail = null;
var rain:flixel.effects.particles.FlxTypedEmitter;
rain = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
//rain.cameras = [camHUD];
rain.width = 1280*4;
rain.start(false, 0.01);
var rain:CustomShader  = new CustomShader("rain");
var explode:FlxSound;
explode = FlxG.sound.load(Paths.sound("hellexplode"));

var exploders:FlxSprite = new FlxSprite();
exploders.frames = Paths.getFrames("stages/hellStreet/explosion");
exploders.animation.addByPrefix("explosion", "explosion",  24, false);
exploders.scale.set(5.8, 5.8);
exploders.scrollFactor.set(0, 0);
exploders.screenCenter();
var explode:FlxSound;
explode = FlxG.sound.load(Paths.sound("hellexplode"));


override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
    rain.data.iTime.value = [-24*Math.sin(time)];
	iconP2.alpha = (2-(health)-0.15)/1+0.2;
	iconP1.alpha = (health-0.15)/1+0.2;
}
function postCreate() {
    satan.setGraphicSize(Std.int(satan.width * 1.2));
    satan.scrollFactor.set(0.2, 0.4);
    satan.screenCenter();
    satan.y += 600;
    satan.x -= 100;
    satan.updateHitbox();
	satan.visible = false;
    hellbg.setGraphicSize(Std.int(hellbg.width * 5));
	asdfsa.visible = false;
    hellbg.alpha = 0.1;
    witheredRa.visible = true;
    firebg.alpha = 0;
    cityback.visible = true;
    cityj.visible = true;
    mountainsback.visible = true;
	mountains.visible = true;
    hillfront.visible = true;
    street.visible = true;
    mountainsbackbl.visible = false;
	hillfrontbl.visible = mountainsbl.visible = streetbl.visible = false;
    wbg.alpha = 0;	
    wbg.scale.set(2,2);
    wbg.updateHitbox();
    wbg.antialiasing = true;
    wbg.screenCenter();
    wbg.scrollFactor.set(0.2, 0.05);
    add(wbg);
	space.visible = false;
	earth.visible = false;
    freindly.visible = false;
	freindly.scrollFactor.set(0.05, 0.05);
	freindly.screenCenter();
	freindly.updateHitbox();
    firebg.scale.set(5,3);
    firebg.scrollFactor.set();
    firebg.screenCenter();
    firebg.alpha = 0;
    add(firebg);
    islands.scale.set(1,1);
    islands.visible = false;
    islands.screenCenter();
    add(islands);		
	exploders.visible = false;
	add(exploders);
	insert(100, snowemitter);
	add(snowemitter);
	snowemitter.start(false, 0.035);

	wastedGrp = new FlxTypedGroup();
	bloodshedGrp = new FlxTypedGroup();

	var cloudsbig = new FlxBackdrop(Paths.image('stages/street/ron_clouds'), FlxAxes.X, 0, 0);
	cloudsbig.scrollFactor.set(0.1,0.1);
	cloudsbig.screenCenter();
	insert(10, cloudsbig);
	wastedGrp.add(cloudsbig);
	
	FlxTween.tween(cloudsbig, {x: cloudsbig.x + 6000}, 720, {type: FlxTween.LOOPING });
	
	var cloudssmall = new FlxBackdrop(Paths.image('stages/street/ron_clouds'), FlxAxes.X, 0, 0);
	cloudssmall.scale.set(0.5,0.5);
	cloudssmall.updateHitbox();
	cloudssmall.scrollFactor.set(0.05,0.1);
	cloudssmall.screenCenter();
	cloudssmall.y -= 120;
	insert(11, cloudssmall);
	wastedGrp.add(cloudssmall);
	
	FlxTween.tween(cloudssmall, {x: cloudssmall.x + 3000}, 360, {type: FlxTween.LOOPING });
	wastedGrp.add(street );
	wastedGrp.add(witheredRa);
	wastedGrp.add(cityback);
	wastedGrp.add(cityj);
	wastedGrp.add(mountainsback);
	wastedGrp.add(mountains);
	wastedGrp.add(hillfront);

}
function stepHit(curStep)
{
   var evilTrail = null;
   if (curStep >= 128 && evilTrail == null) {
       evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);
     }
    if (curStep < 1151)
        Estatic.alpha = (((2-health)/3)+0.3)/2;
    else
        Estatic.alpha = 0;
    if (curStep >= 384)
    {
        if (curStep <= 576 || ((curStep >= 896) && (curStep <= 1151)))				
			snowemitter.x = FlxG.camera.scroll.x;
			snowemitter.y = FlxG.camera.scroll.y;
    }
    else
    {
        Estatic.alpha = 0;
		snowemitter.y = 9999;
    }
    switch (curStep)
    {
		case 128:

			if (FlxG.save.data.rain) {
				FlxG.camera.addShader(rain);
				rain.data.zoom.value = [40];
				rain.data.raindropLength.value = [0.1];
				rain.data.opacity.value = [0.25];
				}
			evilTrail.color = FlxColor.RED;
			insert(members.indexOf(dad)-1, evilTrail);
			//bye_bye_street
			wastedGrp.destroy();

			SCREWYOU = true;
			asdfsa.visible = true;
            mountainsbackbl.visible = true;
            hillfrontbl.visible = true;
            mountainsbl.visible = true;
            streetbl.visible = true;
			satan.visible = true;

			FlxG.camera.flash(FlxColor.WHITE, 1);
			hellbg.alpha = 0.5;
			FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
			//triggerEventNote('Change Scroll Speed', '1.3', '1');
			witheredRa.color = 0xFF660000;
			if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
				chrom.data.rOffset.value = [chromeOffset2/2];
				chrom.data.gOffset.value = [0.0];
				chrom.data.bOffset.value = [chromeOffset2/2];
				}
			cameraSpeed = 2;
		case 256:
			cameraSpeed = 3;
			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 275 ,angle: 360}, 1,{ease: FlxEase.backOut});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 1250 ,angle: 360}, 1, {ease: FlxEase.quintInOut});
/*			for (i in 0...4)
			{ 
				var member = strumLineNotes.members[i];
				FlxTween.tween(strumLineNotes.members[i], { x: defaultStrumX[i]+ 1250 ,angle: 360}, 1, {ease: FlxEase.quintInOut});
				defaultStrumX[i] += 1250;
			}
			for (i in 4...8)
			{ 
				var member = strumLineNotes.members[i];
				FlxTween.tween(strumLineNotes.members[i], { x: defaultStrumX[i] - 275,angle: 360}, 1, {ease: FlxEase.backOut});
				defaultStrumX[i] -= 275;
			}
*/		case 320:
			FlxTween.tween(satan, {y: satan.y - 700, angle: 359.99}, 3, {ease: FlxEase.circInOut});
		case 368:
			defaultCamZoom = 1;
		case 376:
			FlxG.camera.shake(0.03, 1);
		case 382:
			exploders.visible = true;
			exploders.animation.play('explosion');
			FlxG.sound.play(Paths.sound('hellexplode'), 5.7);
		case 384:
			mountainsbackbl.destroy();
			hillfrontbl.destroy();
			mountainsbl.destroy();
			streetbl.destroy();
			exploders.animation.play('explosion');
			FlxG.sound.play(Paths.sound('hellexplode'), 5.7);
			cameramoveshed = true;
			rain.data.zoom.value = [20];
			rain.data.raindropLength.value = [0.05];
			defaultCamZoom = 0.7;
			cameraSpeed = 8;
			FlxTween.color(witheredRa, 1, 0xFF660000, 0xFF000000);
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
			FlxG.camera.flash(FlxColor.WHITE, 1);
			camFollow.y -= 10400;
			boyfriend.y -= 10400;
			dad.y -= 10400;
			gf.visible = false;
//			triggerEventNote('Change Bars Size', '8', '1');
			FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.quadInOut});
			islands.y = boyfriend.y + 5100;
			FlxTween.tween(boyfriend, {x: boyfriend.x + 300}, 0.5, {ease: FlxEase.circOut});
			FlxTween.tween(dad, {x: dad.x - 300}, 0.5, {ease: FlxEase.circOut});
			FlxTween.tween(dad, {y: dad.y + 5600}, 23, {ease: FlxEase.circIn});
			FlxTween.tween(boyfriend, {y: boyfriend.y + 5600}, 23, {ease: FlxEase.circIn});
			FlxTween.tween(boyfriend, {angle: 359.99 * 4}, 23);
			FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
			wbg.alpha = 1;
		case 512:
			defaultCamZoom = 0.75;
			cameraSpeed = 2.5;
		case 576:
			islands.visible = true;
			FlxTween.tween(dad, {y: dad.y + 5600}, 5.4, {ease: FlxEase.quadIn});
			FlxTween.tween(boyfriend, {y: boyfriend.y + 5600}, 5.4, {ease: FlxEase.quadIn});
			defaultCamZoom = 0.85;
			cameraSpeed = 2;
		case 632:
			defaultCamZoom = 1.1;
		case 640:
			cameraSpeed = 1.5;
			rain.data.zoom.value = [40];
			rain.data.raindropLength.value = [0.1];
			cameramoveshed = false;
			defaultCamZoom = 0.7;
			FlxTween.tween(camGame, {angle: 0}, 1, {ease: FlxEase.circOut});
			FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.circOut});
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
			FlxG.camera.flash(FlxColor.WHITE, 1);
//			FlxG.camera.follow(camFollowPos, LOCKON, cameraSpeed);
		case 894:
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);

			exploders.animation.play('explosion');
		case 896: 
			cameramoveshed = true;
			islands.visible = false;
			rain.data.zoom.value = [20];
			rain.data.raindropLength.value = [0.05];
			FlxG.camera.flash(FlxColor.WHITE, 1);	
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
			dad.y -= 5400;
			boyfriend.y -= 5400;
			FlxTween.tween(boyfriend, {angle: 359.99 * 8}, 23);
//			FlxG.camera.follow(camFollowPos, LOCKON, cameraSpeed*2);
		case 1016:
			satan.y = boyfriend.y + 2000;
			FlxTween.tween(satan, {y: boyfriend.y - 2000}, 4);
		case 1136:
			cameramoveshed = false;
			FlxTween.tween(dad, {y: dad.y - 1000}, 1, {ease: FlxEase.quadIn});
			FlxTween.tween(boyfriend, {y: boyfriend.y - 1000}, 1, {ease: FlxEase.quadIn});
			camGame.fade(0xFFFFFFFF, (Conductor.stepCrochet/1000)*14);
			FlxTween.tween(camGame, {angle: 0}, 0.3, {ease: FlxEase.circOut});
			FlxTween.tween(camHUD, {angle: 0}, 0.3, {ease: FlxEase.circOut});
		case 1151: 
//			FlxG.camera.follow(camFollowPos, LOCKON, 0.5);
			defaultCamZoom = 0.7;
			FlxG.camera.flash(FlxColor.WHITE, 1);	
			rain.data.opacity.value = [0.0];
			FlxTween.angle(boyfriend, 0, boyfriend.angle + 359.99, 3, { type: FlxTween.LOOPING } );
			FlxTween.angle(freindly, 0, 5, 3, { type: FlxTween.PINGPONG } );
			camGame.fade(0xFFFFFFFF, 0.1, true);
			intensecameramoveshed = true;
			space.visible = true;
			earth.visible = true;
			freindly.visible = true;
			defaultCamZoom -= 0.1;
			dad.y += 9400;
			boyfriend.y = dad.y+650;
		case 1153: 
			boyfriend.y = dad.y-650;
//			healthBar.setGraphicSize(800,Std.int(healthBar.height));
//			healthBar.updateHitbox();
    }
}