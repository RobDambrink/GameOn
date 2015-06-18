package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.core.Starling;

	public class TutorialScreen extends Sprite {

		var toLevelSelectButton: Image;
		var menuBackground:Image;
		var continueButton:Image;
		var returnButton:Image;

		public function TutorialScreen() {
			// constructor code
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event: Event) {
			trace("TutorialScreen1 loaded");
			
			addMenuBackground();
			addContinueButton();
			addReturnButton();
			
			//if new game option was clicked, then add button to progress to the story screen
			//if (Navigator.breadcrumbs.indexOf("genderSelect") >= 0){
			//	addToLevelSelectButton();
			//}
		}
		
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("tutorial-screen-1"));
			addChild( menuBackground );
		}		
	
		function addContinueButton(){
			continueButton = new Image(Main.assets.getTexture("TutorialContinueButton")); 
			addChild( continueButton );
			
			continueButton.x = (Starling.current.stage.stageWidth - continueButton.width) * (19/20);
			continueButton.y = (Starling.current.stage.stageHeight - continueButton.height) * (1/1);
			
			continueButton.addEventListener( TouchEvent.TOUCH , onContinueButton );
		}
			
		function onContinueButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "tutorial2", 0);
			}
		}
			
		function addReturnButton(){
			returnButton = new Image(Main.assets.getTexture("TutorialReturnButton")); 
			addChild( returnButton );
			
			returnButton.x = (Starling.current.stage.stageWidth - returnButton.width) * (1/20);
			returnButton.y = (Starling.current.stage.stageHeight - returnButton.height) * (1/1);
			
			returnButton.addEventListener( TouchEvent.TOUCH , onReturnButton );
		}
			
		function onReturnButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.breadcrumbs.pop();
				Navigator.breadcrumbs[0] = "mainMenu";
				Navigator.instance.loadScreen(Navigator.breadcrumbs[Navigator.breadcrumbs.length - 1],0);
			}
		}




	}

}