function postCreate() {
	for (i in 1...4) {
		var rainshader = new CustomShader("rain");
		rainshader.zoom = (i / 3) * 70;
		rainshader.raindropLength = 0.1 / i;
		rainshader.opacity = 0.25;
		stage.getSprite("rain" + i).shader = rainshader;
	}
}
function update() 
	for (i in 1...4) stage.getSprite("rain" + i).shader.iTime = Conductor.songPosition / 1000;