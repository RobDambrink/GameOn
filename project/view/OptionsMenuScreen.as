package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	public class OptionsMenuScreen extends Sprite{
		
		var menuBackground:Image;
		var backButton:Image;
		
		public function OptionsMenuScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("OptionsMenuScreen loaded");
			addMenuBackground();
			addBackButton();
		}
		
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		private function addBackButton(){
			backButton = new Image(Main.assets.getTexture("BackButton"));
			addChild(backButton);

			backButton.y = 15;
			backButton.x = 15;

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
		
		/*	
			Implement movie clip for adjusting sound on/off
			Implement language change function
		*/ 

	}
	
}
