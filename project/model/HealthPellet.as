package model {

	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.EnterFrameEvent;
	import view.*;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;	
	

	public class HealthPellet extends Sprite{
		
		var gameScreen:GameScreen;	
		var healthPellet:Image;
		public static var instance:HealthPellet;
		
		public function HealthPellet(screen:GameScreen){
			// constructor code
			instance = this;
			gameScreen = screen;
			
			healthPellet = new Image(Main.assets.getTexture("TileHealthDot"));

			addChild( healthPellet );
			
//			addEventListener( Event.ENTER_FRAME , pelletCheck );
			
		}
		
		
//		function pelletTouched(event:TouchEvent)
//		{
//			var touch:Touch = event.touches[0];
//			
//			if(touch.phase == TouchPhase.BEGAN)
//			{ 
//				HealthBar.hp++;
//				trace(HealthBar.hp);
//				gameScreen.removeHealthPellet(this);
//				gameScreen.updateHealthBar();
//			}
//		}

		public function pelletTouched(){
			HealthBar.hp++;
			trace(HealthBar.hp);
			gameScreen.removeHealthPellet(this);
			gameScreen.updateHealthBar();
		} 
		
	}
	
}
