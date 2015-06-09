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
			
			var wall:Image;
			
			if (type === "House"){
				wall = new Image(Main.assets.getTexture("TileTable"));
			}
			if (type === "Tree"){
				wall = new Image(Main.assets.getTexture("Circle24"));
			}
//			if (type === "Table"){
//				wall = new Image(Main.assets.getTexture("TileTable"));
//			}
			if (type === "Transparent"){
				wall = new Image(Main.assets.getTexture("TileTransparent"));
			}
			if (type === "Exit"){
				wall = new Image(Main.assets.getTexture("TileExit"));
			}
			if (type === "Bounce"){
				wall = new Image(Main.assets.getTexture("TileTransparent"));
			}
			
			wall.alignPivot();
			
			addChild( wall );
		}

	}
	
}
