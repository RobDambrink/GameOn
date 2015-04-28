package  {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	
	public class TutorialScreen extends Sprite{
		
		var toLevelSelectButton:Image;
		
		
		public function TutorialScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("TutorialScreen loaded");

// if new game option was clicked, then add button to progress to the story screen
			if (PlayMenuScreen.newGame){
				addToLevelSelectButton();
			}
		}
		
		
		
		
		
		private function addToLevelSelectButton(){
			var texture:Texture = Texture.fromBitmapData( new ToLevelSelectButton() );
			toLevelSelectButton = new Image( texture );
			addChild( toLevelSelectButton );
			
			toLevelSelectButton.y = 0;
			
			toLevelSelectButton.addEventListener( TouchEvent.TOUCH , onToLevelSelectButton );
		}
		
		private function onToLevelSelectButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				PlayMenuScreen.newGame = false;
				
				Navigator.instance.loadScreen( "levelSelect" );
			}
		}
		
		
		
	}
	
}
