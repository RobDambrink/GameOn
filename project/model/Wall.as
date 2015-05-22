package  model{
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.EnterFrameEvent;
/**
	Walls are the obstacles that form the maze through which the player and enemies move. 
*/
	public class Wall extends Sprite{

		public function Wall() {
			// constructor code
			trace("Wall Constructor");
			var wall:Image = new Image(Main.assets.getTexture("Wall-20x20"));
			addChild( wall );
		}

	}
	
}
