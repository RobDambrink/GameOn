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
			gameScreen = screen;
			healthPellet = new Image(Main.assets.getTexture("TileHealthDot"));
			addChild( healthPellet );			
		}
		
		public function hide(pellet:HealthPellet){
			if(pellet.hidden===false){
				pellet.hidden=true;
				setTimeout(respawn, 5000);
			}
		}
		
		
		public function respawn(){
			this.hidden=false;	
			gameScreen.addChild(this);
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
