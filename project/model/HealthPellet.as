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
		
		public function HealthPellet(screen:GameScreen){
			// constructor code
			gameScreen = screen;
			healthPellet = new Image(Main.assets.getTexture("TileHealthDot"));
			addChild( healthPellet );			
		}


		public function pelletTouched(){
			HealthBar.hp++;
			trace(HealthBar.hp);
			gameScreen.removeHealthPellet(this);
			gameScreen.updateHealthBar();
		} 
		
		
		public function changeDisplay(display:String){
			if (display == "transparent"){
				healthPellet = new Image(Main.assets.getTexture("TileTransparent"));
				GameScreen.pelletVisible = false;			
			}
			if (display == "normal"){
				healthPellet = new Image(Main.assets.getTexture("TileHealthDot"));
				GameScreen.pelletVisible = true;
			}
		}
		
	}
}
