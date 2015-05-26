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

		public function Wall(type:String) {
			// constructor code
			if (type === "House"){
				var wall:Image = new Image(Main.assets.getTexture("TileHouse"));
			}
			if (type === "Tree"){
				var wall:Image = new Image(Main.assets.getTexture("Circle24"));
			}
//			if (type === "Table"){
//				var wall:Image = new Image(Main.assets.getTexture("TileTable"));
//			}
			if (type === "Transparent"){
				var wall:Image = new Image(Main.assets.getTexture("TileTransparent"));
			}
			
			
			addChild( wall );
		}

	}
	
}
