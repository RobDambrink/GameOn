package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	
	public class ScoreScreen extends Sprite{

		public function ScoreScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//This function tells the console that the gamescreen is loaded. Also adds the background to the stage. The function addConditionMet is delayed for 2 seconds, then executes.
		private function onAddedToStage(event:Event)
		{
			trace("ScoreScreen loaded");
			var winning:Image = new Image(Main.assets.getTexture("winning"));
			addChild(winning);
		}

	}
	
}
