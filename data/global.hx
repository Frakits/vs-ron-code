import funkin.editors.ui.UIState;
import funkin.backend.system.Main;
import funkin.menus.MainMenuState;
import funkin.backend.scripting.ModState;
var memoryCounter = 0.0;
function update() {
    FlxG.autoPause = false;
    if (FlxG.keys.justPressed.F5) FlxG.resetState();

    memoryCounter += 0.23;
    Main.framerateSprite.codenameBuildField.text = "REAL Memory Counter: " + memoryCounter + "GB\nThe REAL Psych Engine 0.7";
    Main.framerateSprite.codenameBuildField.y = Main.framerateSprite.memoryCounter.y;
    Main.framerateSprite.memoryCounter.height = 0;
}
var switched = false;
function preStateCreate(state:FlxState) {
	if (state is MainMenuState) 
        FlxG.switchState(new FreeplayState());
}