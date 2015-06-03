package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.core.Starling;

	
	public class PlayMenuScreen extends Sprite{
		
		var continueButton:Image;
		var newGameButton:Image;
		var menuBackground:Image;

		
		public function PlayMenuScreen() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("PlayMenuScreen loaded");
			
			addMenuBackground();
			
			
			
	//if there is a saved game state on the device, then execute
			addContinueButton();
			
			addNewGameButton();
		}
		
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		//--------------------start of adding buttons----------------

		private function addContinueButton(){
			continueButton = new Image(Main.assets.getTexture("ContinueButton"));
			addChild( continueButton );
			
			continueButton.y = Main.scaleFactor * 15;
			continueButton.x = (Starling.current.stage.stageWidth - continueButton.width) / 2;
			
			continueButton.addEventListener( TouchEvent.TOUCH , onContinueButton );
		}
		
		private function addNewGameButton(){
			newGameButton = new Image(Main.assets.getTexture("NewGameButton"));
			addChild( newGameButton );
			
			newGameButton.y = continueButton.y + continueButton.height + (Main.scaleFactor * 10);
			newGameButton.x = (Starling.current.stage.stageWidth - newGameButton.width) / 2;
			
			newGameButton.addEventListener( TouchEvent.TOUCH , onNewGameButton );
		}
		//---------------end of adding buttons------------------
		
		
		
		//---------------start of button's event handlers-------
		
		private function onContinueButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "levelSelect" );
			}
		}
		
		private function onNewGameButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
// WARNING that New Game deletes all progress! 
				Navigator.instance.loadScreen( "genderSelect" );
			}
		}
		//---------------end of button's event handlers---------

	}
	
}
