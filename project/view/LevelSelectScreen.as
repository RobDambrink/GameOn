package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.core.Starling;
	
	public class LevelSelectScreen extends Sprite{
		
		var nextButton:Image;
		var levelSelectButton:Image;
		var menuBackground:Image;
		
		public function LevelSelectScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("LevelSelectScreen 1 loaded");
			addMenuBackground();
			addLevelOneButton();
			addLevelTwoButton();
			addLevelThreeButton();
			addNextButton();
		}
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("background-orange"));
			addChild( menuBackground );
		}
		
		
		private function addNextButton(){
			nextButton = new Image(Main.assets.getTexture("ArrowsRight")); 
			addChild( nextButton );
			
			nextButton.x = (Starling.current.stage.stageWidth - nextButton.width) * (19/20);
			nextButton.y = (Starling.current.stage.stageHeight - nextButton.height) * (1/2);
			
			nextButton.addEventListener( TouchEvent.TOUCH , onNextButton );
		}
		
		private function onNextButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "levelSelect2", 1 );
				
			}
		}
		
		
		private function addLevelOneButton(){
			levelSelectButton = new Image(Main.assets.getTexture("Level1")); 
			addChild( levelSelectButton );
			
			levelSelectButton.x = (Starling.current.stage.stageWidth - levelSelectButton.width) * (1/4);
			levelSelectButton.y = (Starling.current.stage.stageHeight - levelSelectButton.height) * (1/3);
			
			levelSelectButton.addEventListener( TouchEvent.TOUCH , onLevelOneButton );
		}
		
		private function onLevelOneButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story", 1 );
				
			}
		}
		
		
		
		private function addLevelTwoButton(){
			levelSelectButton = new Image(Main.assets.getTexture("Level2")); 
			addChild( levelSelectButton );
			
			levelSelectButton.x = (Starling.current.stage.stageWidth - levelSelectButton.width) * (1/2);
			levelSelectButton.y = (Starling.current.stage.stageHeight - levelSelectButton.height) * (1/3);
			
			levelSelectButton.addEventListener( TouchEvent.TOUCH , onLevelTwoButton );
		}
		
		private function onLevelTwoButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 2);
			}
		}

		
		
		private function addLevelThreeButton(){
			levelSelectButton = new Image(Main.assets.getTexture("Level3")); 
			addChild( levelSelectButton );
			
			levelSelectButton.x = (Starling.current.stage.stageWidth - levelSelectButton.width) * (3/4);
			levelSelectButton.y = (Starling.current.stage.stageHeight - levelSelectButton.height) * (1/3);
			
			levelSelectButton.addEventListener( TouchEvent.TOUCH , onLevelThreeButton );
		}
		
		private function onLevelThreeButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 3);
			}
		}
		
		
		
	}
	
}
