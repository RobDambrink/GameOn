package model {
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;	
	import view.*;


	public class HealthBar extends Sprite{
		
		var gameScreen:GameScreen;
		var healthFill:Image;
		
		public static var hp:int = 10;
		public static var maxHp:int = 100;
		var percentHp:Number = hp/maxHp;
		

		
		
		public function HealthBar(screen:GameScreen) {
			// constructor code
			var healthStroke:Image = new Image(Navigator.assets.getTexture("StrokeHealthBar"));
			addChild( healthStroke );
			
			healthFill = new Image(Navigator.assets.getTexture("FillHealthBar"));
			addChild( healthFill );
			healthFill.x = healthStroke.x + 8;
			healthFill.y = healthStroke.y + 8;
			
			healthFill.height = 186;
		}
		
		
		public function updateHealthBar(){
			percentHp = hp / maxHp;
			healthFill.scaleX = percentHp;
			
			if (hp > (maxHp - 1)){
				hp = maxHp;
				trace("u win m8");
			}
			
			if (hp < 1){
				hp = 0;
				trace("u ded m8");
			}
		}
		
		
		
	}
	
}
