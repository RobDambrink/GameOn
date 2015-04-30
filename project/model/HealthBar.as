package  model{
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;	
	
	
	public class HealthBar extends Sprite{

		public static var maxHealthPoints:int = 100;
		public static var healthPoints:int = 10;
		public static var percentageHealthPoints:Number = healthPoints / maxHealthPoints;
		
		public function HealthBar() {
			// constructor code
		}		
		
		
		public function updateHealthBar(){
			percentageHealthPoints = healthPoints / maxHealthPoints;
		}
		
		
		
	}
	
}
