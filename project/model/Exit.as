package model {
	import starling.display.Sprite;
	import starling.display.Image;
	
	public class Exit extends Sprite{
		
		var exit:Image;
		
		public function Exit(){
			// constructor code
			exit = new Image(Main.assets.getTexture("TileTransparent"));
			addChild(exit);
		}

	}
	
}
