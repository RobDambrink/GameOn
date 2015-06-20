package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.core.Starling;
	
	public class LevelSelectScreen extends Sprite{
		
		var nextButton:Image;
		var level1SelectButton:Image;
		var level2SelectButton:Image;
		var level3SelectButton:Image;
		var menuBackground:Image;
		
		public function LevelSelectScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("LevelSelectScreen 1 loaded");
			addMenuBackground();
			addLevelOneButton();
			addLevelTwoButton();
			addLevelThreeButton();
			addNextButton();
			trace("level 1 score: ",MainMenuScreen.saveDataObject.data.level1Score);
			trace("level 2 score: ",MainMenuScreen.saveDataObject.data.level2Score);
			trace("level 3 score: ",MainMenuScreen.saveDataObject.data.level3Score);

		}
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("background-orange"));
			addChild( menuBackground );
		}
		
		
		private function addNextButton(){
			nextButton = new Image(Main.assets.getTexture("ArrowsRight")); 
			addChild( nextButton );
			
			nextButton.x = (Starling.current.stage.stageWidth - nextButton.width) * (19/20);
			nextButton.y = (Starling.current.stage.stageHeight - nextButton.height) * (1/2);
			
			nextButton.addEventListener( TouchEvent.TOUCH , onNextButton );
		}
		
		private function onNextButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "levelSelect2", 1 );
				
			}
		}
		
		
		private function addLevelOneButton(){
			level1SelectButton = new Image(Main.assets.getTexture("Level1")); 
			addChild( level1SelectButton );
			
			level1SelectButton.x = (Starling.current.stage.stageWidth - level1SelectButton.width) * (1/4);
			level1SelectButton.y = (Starling.current.stage.stageHeight - level1SelectButton.height) * (1/3);
			
			level1SelectButton.addEventListener( TouchEvent.TOUCH , onLevelOneButton );
			
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level1Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level1Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level1Score==3){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("Star"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else{
				star1 = new Image(Main.assets.getTexture("StarGrey"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );			
			}
			
			star1.width=level1SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level1SelectButton.x-star1.width+3;
			star1.y=level1SelectButton.y+level1SelectButton.height+5;
			star2.x=level1SelectButton.x+3;
			star2.y=level1SelectButton.y+level1SelectButton.height+5;
			star3.x=level1SelectButton.x+star1.width+3;
			star3.y=level1SelectButton.y+level1SelectButton.height+5;
		}
		
		private function onLevelOneButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story", 1 );
				
			}
		}
		
		
		
		private function addLevelTwoButton(){
			if(MainMenuScreen.saveDataObject.data.level1Score>0){	
				level2SelectButton = new Image(Main.assets.getTexture("Level2")); 
				addChild( level2SelectButton );
				
				level2SelectButton.x = (Starling.current.stage.stageWidth - level2SelectButton.width) * (1/2);
				level2SelectButton.y = (Starling.current.stage.stageHeight - level2SelectButton.height) * (1/3);
				
				level2SelectButton.addEventListener( TouchEvent.TOUCH , onLevelTwoButton );
			}
			else{
				level2SelectButton = new Image(Main.assets.getTexture("Level2Grey")); 
				addChild( level2SelectButton );
				
				level2SelectButton.x = (Starling.current.stage.stageWidth - level2SelectButton.width) * (1/2);
				level2SelectButton.y = (Starling.current.stage.stageHeight - level2SelectButton.height) * (1/3);
			}
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level2Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level2Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level2Score==3){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("Star"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else{
				star1 = new Image(Main.assets.getTexture("StarGrey"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			star1.width=level1SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level2SelectButton.x-star1.width+3;
			star1.y=level2SelectButton.y+level2SelectButton.height+5;
			star2.x=level2SelectButton.x+3;
			star2.y=level2SelectButton.y+level2SelectButton.height+5;
			star3.x=level2SelectButton.x+star1.width+3;
			star3.y=level2SelectButton.y+level2SelectButton.height+5;
		}
		
		private function onLevelTwoButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 2);
			}
		}


		private function addLevelThreeButton(){			
			if(MainMenuScreen.saveDataObject.data.level2Score>0){				
			level3SelectButton = new Image(Main.assets.getTexture("Level3")); 
			addChild( level3SelectButton );
			
			level3SelectButton.x = (Starling.current.stage.stageWidth - level3SelectButton.width) * (3/4);
			level3SelectButton.y = (Starling.current.stage.stageHeight - level3SelectButton.height) * (1/3);
			
			level3SelectButton.addEventListener( TouchEvent.TOUCH , onLevelThreeButton );
			}
			else{
			level3SelectButton = new Image(Main.assets.getTexture("Level3Grey")); 
			addChild( level3SelectButton );
			
			level3SelectButton.x = (Starling.current.stage.stageWidth - level3SelectButton.width) * (3/4);
			level3SelectButton.y = (Starling.current.stage.stageHeight - level3SelectButton.height) * (1/3);
			}
			
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level3Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level3Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level3Score==3){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("Star"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else{
				star1 = new Image(Main.assets.getTexture("StarGrey"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			star1.width=level1SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level3SelectButton.x-star1.width+3;
			star1.y=level3SelectButton.y+level3SelectButton.height+5;
			star2.x=level3SelectButton.x+3;
			star2.y=level3SelectButton.y+level3SelectButton.height+5;
			star3.x=level3SelectButton.x+star1.width+3;
			star3.y=level3SelectButton.y+level3SelectButton.height+5;
		}
		
		private function onLevelThreeButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 3);
			}
		}
	}
}