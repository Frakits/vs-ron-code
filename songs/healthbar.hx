import flixel.math.FlxRect;
import StringTools;
var evilMode = false;
var classical = StringTools.endsWith(curSong, "classic");
var img = "game/healthBar/healthBarintheworks";
var barbg:FlxSprite;
var barbg2:FlxSprite;

function postCreate()
{
	if (!classical)
	{
		barbg2 = new FlxSprite().loadGraphic(Paths.image(img));
		insert(members.indexOf(healthBarBG)+1, barbg2);
		
		barbg = new FlxSprite().loadGraphic(Paths.image(img));
		insert(members.indexOf(barbg2)+1, barbg);

		barbg.cameras = barbg2.cameras = [camHUD];
		barbg.y = barbg2.y = FlxG.height * 0.88;
		barbg.screenCenter(0x01);
		barbg2.screenCenter(0x01);
		
		healthBarBG.visible = healthBar.visible = false;

		barbg.color = CoolUtil.getColorFromDynamic(boyfriend.xml.get("color"));
		barbg2.color = CoolUtil.getColorFromDynamic(dad.xml.get("color"));
	}
}

function switchToCoolHealthBar() {
	evilMode = !evilMode;
	if (evilMode == true)
	{
		barbg.loadGraphic(Paths.image(img+"2"));
		barbg2.loadGraphic(Paths.image(img+"2"));

		barbg.setGraphicSize(800,Std.int(barbg.height));
		barbg.updateHitbox();
		barbg.screenCenter(0x01);
		barbg2.screenCenter(0x01);
		
		barbg.y -= 24;
		barbg2.y -= 24;
		
		barbg.x += 4;
		barbg2.x += 4;
	}
	else
	{
		barbg.loadGraphic(Paths.image(img));
		barbg2.loadGraphic(Paths.image(img));

		barbg.setGraphicSize(601,Std.int(barbg.height));
		barbg.updateHitbox();
		
		barbg.y = barbg2.y = FlxG.height * 0.88;
		
		barbg.screenCenter(0x01);
		barbg2.screenCenter(0x01);
	}
}

function update()
{
	if (classical) return;
	barbg.clipRect = new FlxRect((2-health)/2*barbg.width,0,health/2*barbg.width,barbg.height);
}