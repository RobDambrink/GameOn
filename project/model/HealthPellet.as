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
	import flash.utils.setTimeout;
	

	public class HealthPellet extends Sprite{
		
		var gameScreen:GameScreen;	
		var healthPellet:Image;
		public var hidden:Boolean=false;
		
		public function HealthPellet(screen:GameScreen){
			// constructor code			
			gameScreen = screen;
			
			applyTexture();

			//healthPellet = new Image(Main.assets.getTexture("TileHealthDot"));
			
			healthPellet.alignPivot();
			
			addChild( healthPellet );			
		}
		
		public function hide(pellet:HealthPellet){
			if(pellet.hidden===false){
				trace("hiding");
			//	
				pellet.hidden=true;
			//	//gameScreen.removeChild(this);
			//	//applyTexture();
			//	//enter the respawn timer in milliseconds, currently 2 seconds for testing purposes.
			//	
			//	//Starling.juggler.delayCall(respawn, 2);
				setTimeout(respawn, 5000);
			}
		}
		
		public function applyTexture(){
			if (!this.hidden){
				healthPellet = new Image(Main.assets.getTexture("TileHealthDot"));
				trace("applytexture not hidden");
			}
			else if (hidden){
				
				healthPellet = new Image(Main.assets.getTexture("TileTransparent"));
				trace("applytexture hidden");
			}
		}
		
		public function respawn(){
			trace("respawnerino");
			this.hidden=false;	
			gameScreen.addChild(this);
			//applyTexture();
		}

		public function pelletTouched(pellet:HealthPellet){
			if(!this.hidden){
				hide(pellet);
				HealthBar.hp++;
				trace(HealthBar.hp);
				gameScreen.removeHealthPellet(this);
				gameScreen.updateHealthBar();
			}
		} 
		
	}
	
}
