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
		
		public static var hp:int = 85;
		public static var maxHp:int = 100;
		var percentHp:Number = hp/maxHp;


		public function HealthBar(screen:GameScreen) {
			var healthStroke:Image = new Image(Main.assets.getTexture("HealthBarEmpty"));
			addChild( healthStroke );
			healthFill = new Image(Main.assets.getTexture("HealthBarFull"));
			addChild( healthFill );
			healthFill.x = healthStroke.x;
			healthFill.y = healthStroke.y;
		}
		
		
		public function updateHealthBar(){			
			if (hp > (maxHp - 1)){
				hp = maxHp;
			}			
			if (hp < 1){
				hp = 0;
				Navigator.instance.loadScreen( "levelSelect" ,0);
			}
			percentHp = hp / maxHp;
			healthFill.scaleX = (percentHp - 0.01);
		}
	}
}
