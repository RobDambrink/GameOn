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
		public static var currency:int;
		var starCount:int;
		var background:Image;

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
			addBackground();
			countStars();
			saveScore();
		}
		
		function addBackground(){
			background = new Image(Main.assets.getTexture("background-orange"));
			addChild(background);
		}
		
		function saveScore(){
			if(GameScreen.thisLevel==1){
				if(MainMenuScreen.saveDataObject.data.level1Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level1Score);
					MainMenuScreen.saveDataObject.data.level1Score = starCount;
				}
			}
			if(GameScreen.thisLevel==2){
				if(MainMenuScreen.saveDataObject.data.level2Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level2Score);
					MainMenuScreen.saveDataObject.data.level2Score = starCount;
				}			}
			if(GameScreen.thisLevel==3){
				if(MainMenuScreen.saveDataObject.data.level3Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level3Score);
					MainMenuScreen.saveDataObject.data.level3Score = starCount;
				}			}
			if(GameScreen.thisLevel==4){
				if(MainMenuScreen.saveDataObject.data.level4Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level4Score);
					MainMenuScreen.saveDataObject.data.level4Score = starCount;
				}			}
			if(GameScreen.thisLevel==5){
				if(MainMenuScreen.saveDataObject.data.level5Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level5Score);
					MainMenuScreen.saveDataObject.data.level5Score = starCount;
				}			}
			if(GameScreen.thisLevel==6){
				if(MainMenuScreen.saveDataObject.data.level6Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level6Score);
					MainMenuScreen.saveDataObject.data.level6Score = starCount;
				}			}
			if(GameScreen.thisLevel==7){
				if(MainMenuScreen.saveDataObject.data.level7Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level7Score);
					MainMenuScreen.saveDataObject.data.level7Score = starCount;
				}			}
			if(GameScreen.thisLevel==8){
				if(MainMenuScreen.saveDataObject.data.level8Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level8Score);
					MainMenuScreen.saveDataObject.data.level8Score = starCount;
				}			}
			if(GameScreen.thisLevel==9){
				if(MainMenuScreen.saveDataObject.data.level9Score < starCount){
					MainMenuScreen.saveDataObject.data.currency+=(starCount-MainMenuScreen.saveDataObject.data.level9Score);
					MainMenuScreen.saveDataObject.data.level9Score = starCount;
				}			}
			MainMenuScreen.saveDataObject.flush();
			trace("Stars level 1: ", MainMenuScreen.saveDataObject.data.level1Score);
			trace("Stars level 2: ", MainMenuScreen.saveDataObject.data.level2Score);
		}
		

		public function countStars(){
			if(score<4000){
				starCount=0;
			}
			else if(score>=4000 && score<=8000){
				starCount=1;
			}
			else if(score>8000 && score<=13000){
				starCount=2;
			}
			else if(score>13000){
				starCount=3;
			}
			else{
				starCount=0;
			}
			addStars(starCount);
		}
		public function addStars(starCount:int){
			if(starCount==0){
				star1 = new Image(Main.assets.getTexture("StarGrey"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(starCount==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(starCount==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(starCount==3){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("Star"));
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
