package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	
	public class OptionsMenuScreen extends Sprite{
		
		var menuBackground:Image;
		
		public function OptionsMenuScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("OptionsMenuScreen loaded");
			addMenuBackground();
		}
		
		
		function addMenuBackground(){
			menuBackground = new Image(Navigator.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		
		/*	
			Implement movie clip for adjusting sound on/off
			Implement language change function
		*/ 

	}
	
}
