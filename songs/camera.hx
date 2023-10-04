import flixel.math.FlxRandom;
import flixel.math.FlxVelocity;
import flixel.addons.util.FlxSimplex;
var angle:Float;
var cameraFollow:FlxSprite = new FlxSprite();
var driftAmount = 30;
var time:Float = 0;

var speedIthink = 0.3;
function postCreate() {
	add(cameraFollow);
	cameraFollow.visible = false;
	cameraFollow.setPosition(camFollow.x, camFollow.y);
	FlxG.camera.follow(cameraFollow);
	FlxG.game.addShader(new CustomShader("NVIDIA RTX Architecture"));
}

var trauma = 0;
var speed = 0.0;
var xoffset = 0.0;
var yoffset = 0.0;
var angleoffset = 0.0;
function shake(traumatizer = 0.3, ?speedizer) {
	trauma = traumatizer;
	speed = speedizer;
	xoffset = FlxG.random.float(-100, 100);
	yoffset = FlxG.random.float(-100, 100);
	angleoffset = FlxG.random.float(-100, 100);
}

var shakeFormula = 0;
var lastElapsedTime = 0;
var rotateTarget = 0;
function updatePost60(elapsed) {
	time += elapsed;
	lastElapsedTime += elapsed;
	camHUD.followLerp = FlxG.camera.followLerp * 2;

	var animName = "";
	for (i in strumLines.members[curCameraTarget].characters) {
		camFollow.x += i.getAnimName() == "singRIGHT" ? driftAmount : i.getAnimName() == "singLEFT" ? -driftAmount : 0;
		camFollow.y += i.getAnimName() == "singDOWN" ? driftAmount : i.getAnimName() == "singUP" ? -driftAmount : 0;
		rotateTarget += i.getAnimName() == "singLEFT" ? 2 : i.getAnimName() == "singRIGHT" ? -2 : 0;
	}
	if (animName == "") rotateTarget = 0;
	FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle, rotateTarget, 0.04);

	//credit to wizard.hx lol
	trauma = FlxMath.bound(trauma - 0.02, 0, 1);
	FlxG.camera.angle += 5 * (trauma * trauma) * FlxSimplex.simplex(trauma * 25.5, trauma * 25.5 + angleoffset);
	FlxG.camera.scroll.x += 50 * (trauma * trauma) * FlxSimplex.simplex(trauma * 100 + xoffset, 10);
	FlxG.camera.scroll.y += 50 * (trauma * trauma) * FlxSimplex.simplex(10, trauma * 100 + yoffset);

	//Smooth camera experiment
	//cameraFollow.velocity.set(camFollow.x - cameraFollow.x, camFollow.y - cameraFollow.y); // old and not very smooth
	var realSpeed = 0.005;
	cameraFollow.acceleration.set(((camFollow.x - cameraFollow.x) - (cameraFollow.velocity.x * speedIthink)) / realSpeed, ((camFollow.y - cameraFollow.y) - (cameraFollow.velocity.y * speedIthink)) / realSpeed); // so much smoothness

	for (i in zoomTweens) i.active = !paused;
}
function setDriftAmount(value:Float) {driftAmount = value;}

var zoomTweens = [];

function tweenZoom(amount:Float, beats:Float, ease:String, ?affectHUD = 'true', ?doChangeDefaultZoom = 'false') {
	zoomTweens.push(FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + Std.parseFloat(amount)}, Conductor.stepCrochet / 250 * beats, {ease: CoolUtil.getEase(ease)}));
	if (doChangeDefaultZoom == 'true') zoomTweens.push(FlxTween.tween(PlayState, {defaultCamZoom: PlayState.defaultCamZoom + Std.parseFloat(amount)}, Conductor.stepCrochet / 250 * beats, {ease: CoolUtil.getEase(ease)}));
	if (affectHUD == 'true') zoomTweens.push(FlxTween.tween(camHUD, {zoom: camHUD.zoom + amount/3}, Conductor.stepCrochet / 250 * beats, {ease: CoolUtil.getEase(ease)}));
}

function reset() {
	FlxG.camera.follow(cameraFollow);
	zoomTweens = [];
}