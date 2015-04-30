package view{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class OptionsMenuScreen extends Sprite{

		public function OptionsMenuScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("OptionsMenuScreen loaded");
		}
		
		
		/*	
			Implement movie clip for adjusting sound on/off
			Implement language change function
		*/ 

	}
	
}
