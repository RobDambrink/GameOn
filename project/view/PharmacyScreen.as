package  {
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class PharmacyScreen extends Sprite{

		public function PharmacyScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("PharmacyScreen loaded");
		}
		
	}
	
}
