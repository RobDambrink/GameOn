package  {

	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.EnterFrameEvent;


	public class HealthPellet extends Sprite{
		
		
		public function HealthPellet(){
			// constructor code
			
			spawn();
			
			if (hit){
				respawn();
			}
			
		}

		
		function respawn(){
			removeChild(this);
			Starling.juggler.delayCall(spawn, 5.0);
		}
		
		function spawn(){
			addChild(this);
		}


/*		function pelletHit(){
			 HealthBar.healthPoints++;
			 HealthBar.updateHealthBar(); //update the health bar
		}
		
		function checkDeath (event:EnterFrameEvent){
			if(HealthBar.healthPoints <= 0){
				HealthBar.healthPoints = 0; 
				trace("You died!"); //add any extra death-code here
			}
		}
*/		
		
	}
	
}
