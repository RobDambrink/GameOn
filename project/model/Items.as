package  model{
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import view.*;
	
	public class Items extends Sprite{

		var condom:Image;
		
		//Currently, every number larger than 0 will produce the same asset. We will have to make it so either multiple condoms or a single asset of more than one condom is loaded instead.
		public function Items(number:int) {
			if(number>=1){	
				condom= new Image(Main.assets.getTexture("Circle24"));
				addChild( condom );
			}
		}

	}
	
}
