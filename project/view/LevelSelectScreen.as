package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class LevelSelectScreen extends Sprite{
		
		
		var levelSelectButton:Image;
		
		
		public function LevelSelectScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("LevelSelectScreen loaded");
			addLevelSelectButton();
		}
		
		
		
		
		private function addLevelSelectButton(){
			var texture:Texture = Texture.fromBitmapData( new LevelSelectButton() );
			levelSelectButton = new Image( texture );
			addChild( levelSelectButton );
			
			levelSelectButton.y = 0;
			
			levelSelectButton.addEventListener( TouchEvent.TOUCH , onLevelSelectButton );
		}
		
		private function onLevelSelectButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "game" );
			}
		}
		
		
	}
	
}
