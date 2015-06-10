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

	public class TutorialScreen extends Sprite {

		var toLevelSelectButton: Image;
		var menuBackground:Image;
		var backButton:Image;

		public function TutorialScreen() {
			// constructor code

			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event: Event) {
			trace("TutorialScreen loaded");
			
			addMenuBackground();
			addBackButton();
			
			// if new game option was clicked, then add button to progress to the story screen
			if (Navigator.breadcrumbs.indexOf("genderSelect") >= 0){
				addToLevelSelectButton();
			}
		}
		
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		
		private function addToLevelSelectButton() {
			toLevelSelectButton = new Image(Main.assets.getTexture("ToLevelSelectButton")); 
			addChild(toLevelSelectButton);

			toLevelSelectButton.y = 0;

			toLevelSelectButton.addEventListener(TouchEvent.TOUCH, onToLevelSelectButton);
		}

		private function onToLevelSelectButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.instance.loadScreen("levelSelect",0);
			}
		}
		
		private function addBackButton(){
			backButton = new Image(Main.assets.getTexture("BackButton"));
			addChild(backButton);

			backButton.y = Main.scaleFactor * 15;
			backButton.x = Main.scaleFactor * 15;

			backButton.addEventListener(TouchEvent.TOUCH, onBackButton);
		}
		
		private function onBackButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.breadcrumbs.pop();
				Navigator.breadcrumbs[0] = "mainMenu";
				Navigator.instance.loadScreen(Navigator.breadcrumbs[Navigator.breadcrumbs.length - 1],0);
			}
		}


	}

}