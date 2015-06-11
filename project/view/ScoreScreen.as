package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	
	public class ScoreScreen extends Sprite{
		
		public var score:int;

		public function ScoreScreen(score:int) {
			// constructor code
			this.score=score;
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//This function tells the console that the gamescreen is loaded. Also adds the background to the stage. The function addConditionMet is delayed for 2 seconds, then executes.
		private function onAddedToStage(event:Event)
		{
			trace("ScoreScreen loaded");
			trace("score achieved: ", score);
			var winning:Image = new Image(Main.assets.getTexture("winning"));
			addChild(winning);
		}

	}
	
}
