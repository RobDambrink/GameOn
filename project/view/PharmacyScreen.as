package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	
	public class PharmacyScreen extends Sprite{
		
		var menuBackground:Image;
		
		public function PharmacyScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("PharmacyScreen loaded");
			addMenuBackground();
		}
		
		
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
	}
	
}
