import funkin.editors.ui.UIState;
import funkin.backend.system.Main;
import funkin.menus.MainMenuState;
import funkin.backend.scripting.ModState;
import flixel.FlxG;
var memoryCounter = 0.0;
function update() {
    FlxG.autoPause = false;
    if (FlxG.keys.justPressed.F5) FlxG.resetState();

    memoryCounter += 0.23;
    Main.framerateSprite.codenameBuildField.text = "REAL Memory Counter: " + memoryCounter + "GB\nThe REAL Psych Engine 0.7";
    Main.framerateSprite.codenameBuildField.y = Main.framerateSprite.memoryCounter.y;
    Main.framerateSprite.memoryCounter.height = 0;
}
var redirectStates:Map<FlxState, FlxState> = [
    MainMenuState => new ModState("DesktopState"), 
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys()) 
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) 
            FlxG.game._requestedState = redirectStates.get(redirectState);
}