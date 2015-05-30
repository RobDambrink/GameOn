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
		var hidden:Boolean=false;
		
		public function HealthPellet(screen:GameScreen){
			// constructor code			
			gameScreen = screen;
			healthPellet = new Image(Main.assets.getTexture("TileHealthDot"));
			addChild( healthPellet );			
		}
		
		public function hide(){
			if(hidden===false){
				trace("hiding");
				hidden=true;
				//enter the respawn timer in milliseconds, currently 2 seconds for testing purposes.
				setTimeout(respawn, 2000);
			}
		}
		
		public function respawn(){
			trace("respawnerino");
			hidden=false;			
		}

		public function pelletTouched(){
			if(!hidden){
				hide();
				HealthBar.hp++;
				trace(HealthBar.hp);
				gameScreen.removeHealthPellet(this);
				gameScreen.updateHealthBar();
			}
		} 
		
	}
	
}
