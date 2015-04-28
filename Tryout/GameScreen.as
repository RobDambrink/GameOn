package  {
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.core.Starling;
	import starling.events.Event;

	public class GameScreen extends Sprite{

		
		var toScoreScreenButton:Image;		
		
		
		// constructor code
		public function GameScreen() 
		{
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//This function tells the console that the gamescreen is loaded. Also adds the background to the stage. The function addConditionMet is delayed for 2 seconds, then executes.
		private function onAddedToStage(event:Event)
		{
			trace("GameScreen loaded");
			
			
			var healthBar:HealthBar = new HealthBar();
			addChild(healthBar);
			
			// GAME MECHANIC
			
			
			
			addToScoreScreenButton();
		}
		
		
		
		
		
		private function addToScoreScreenButton(){
			var texture:Texture = Texture.fromBitmapData( new ToScoreScreenButton() );
			toScoreScreenButton = new Image( texture );
			addChild( toScoreScreenButton );
			
			toScoreScreenButton.y = 0;
			
			toScoreScreenButton.addEventListener( TouchEvent.TOUCH , onToScoreScreenButton );
		}
		
		private function onToScoreScreenButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "scoreScreen" );
			}
		}


	
	}
	
}
