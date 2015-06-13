package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.core.Starling;
	
	
	public class LevelSelectScreen2 extends Sprite{
		
		var previousButton:Image;
		var nextButton:Image;
		var levelSelectButton:Image;
		var menuBackground:Image;
		
		public function LevelSelectScreen2() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("LevelSelectScreen 2 loaded");
			addMenuBackground();
			addLevelOneButton();
			addLevelTwoButton();
			addLevelThreeButton();
			addPreviousButton();
			addNextButton();
		}

		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("background-orange"));
			addChild( menuBackground );
		}
		
		
		private function addPreviousButton(){
			previousButton = new Image(Main.assets.getTexture("ArrowsLeft")); 
			addChild( previousButton );
			
			previousButton.x = (Starling.current.stage.stageWidth - previousButton.width) * (1/20);
			previousButton.y = (Starling.current.stage.stageHeight - previousButton.height) * (1/2);
			
			previousButton.addEventListener( TouchEvent.TOUCH , onPreviousButton );
		}
		
		private function onPreviousButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "levelSelect", 1 );
				
			}
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
				Navigator.instance.loadScreen( "levelSelect3", 1 );
				
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
				Navigator.instance.loadScreen( "story", 4 );
				
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
				Navigator.instance.loadScreen( "story" , 5);
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
				Navigator.instance.loadScreen( "story" , 6);
			}
		}		
		
		
		
	}
	
}
