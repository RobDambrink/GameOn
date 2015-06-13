package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.core.Starling;
	
	public class ScoreScreen extends Sprite{
		
		public var score:int;
		var star1:Image;
		var star2:Image;
		var star3:Image;
		public var currency:int;

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
			countStars();
		}
		
		public function countStars(){
			var starCount:int;
			if(score<=6000){
				starCount=1;
			}
			else if(score>6000 && score<=12521){
				starCount=2;
			}
			else if(score>12521){
				starCount=3;
			}
			else{
				starCount=0;
			}
			addStars(starCount);
			currency+=starCount;
		}
		public function addStars(starCount:int){
			if(starCount==1){
				star1 = new Image(Main.assets.getTexture("Circle"));
				star2 = new Image(Main.assets.getTexture("green"));
				star3 = new Image(Main.assets.getTexture("green"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(starCount==2){
				star1 = new Image(Main.assets.getTexture("Circle"));
				star2 = new Image(Main.assets.getTexture("Circle"));
				star3 = new Image(Main.assets.getTexture("green"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(starCount==3){
				star1 = new Image(Main.assets.getTexture("Circle"));
				star2 = new Image(Main.assets.getTexture("Circle"));
				star3 = new Image(Main.assets.getTexture("Circle"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			star1.x=(Starling.current.stage.stageWidth - star1.width)*(1/4);
			star1.y=Starling.current.stage.stageHeight/2;
			star2.x=(Starling.current.stage.stageWidth - star2.width)*(1/2);
			star2.y=Starling.current.stage.stageHeight/2;
			star3.x=(Starling.current.stage.stageWidth - star3.width)*(3/4);
			star3.y=Starling.current.stage.stageHeight/2;
		}

	}
	
}
