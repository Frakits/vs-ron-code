import funkin.game.Stage;
var wastedStage;
var wastedCharacters = [];
function create() {
	wastedStage = new Stage("pissedStreet");
	var it = 0;
	for (i in wastedStage.stageSprites) {
		remove(i);
		insert(it++, i);
	}
	for (i in [["gfDark", gf], ["bfDark", boyfriend], ["ronslightly", dad]]) 
		wastedCharacters.push(insert(members.indexOf(stage), new Character(0, 0, i[0], i[1].isPlayer)));
	wastedCharacters.reverse();
	for (i in 0...wastedCharacters.length) {
		wastedCharacters[i].visible = false;
		stage.applyCharStuff(wastedCharacters[i], (switch(i) {
			case 0: "dad";
			case 1: "boyfriend";
			case 2: "girlfriend";
		}), i);
	}
}
function beatHit(curBeat) {
	if (curBeat == 328) {
		for (i in stage.stageSprites) remove(i);
		for (i in 0...wastedCharacters.length) {
			camGame.flash();
			remove(strumLines.members[i].characters[0]);
			strumLines.members[i].characters[0] = wastedCharacters[i];
			wastedCharacters[i].visible = true;
		}
	}
}