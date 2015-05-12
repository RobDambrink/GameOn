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
		//var main:Main;		
		
		
		public function HealthPellet(screen:GameScreen){
			// constructor code
			
			gameScreen = screen;
			
<<<<<<< HEAD
			var pellet:Image = new Image(Main.assets.getTexture("Circle"));
=======
			var pellet:Image = new Image(Navigator.assets.getTexture("HealthDot"));
>>>>>>> ba00e991d302bfaa0cfdaa1fc8705fc36d7c58e5
			addChild( pellet );
			
			addEventListener( TouchEvent.TOUCH , pelletTouched );
			
		}
		
		
		function pelletTouched(event:TouchEvent)
		{
			var touch:Touch = event.touches[0];
			
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				HealthBar.hp++;
				trace(HealthBar.hp);
				gameScreen.removeHealthPellet(this);
				gameScreen.updateHealthBar();
			}
		}



		
	}
	
}
