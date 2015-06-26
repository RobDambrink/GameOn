package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.core.Starling;
	
	
	public class LevelSelectScreen2 extends Sprite{
		
		var previousButton:Image;
		var nextButton:Image;
		var level4SelectButton:Image;
		var level5SelectButton:Image;
		var level6SelectButton:Image;
		var menuBackground:Image;
		var lock:Image;
		
		public function LevelSelectScreen2() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("LevelSelectScreen 2 loaded");
			addMenuBackground();
			addLevelFourButton();
			addLevelFiveButton();
			addLevelSixButton();
			if(MainMenuScreen.saveDataObject.data.level3Score==0 || MainMenuScreen.saveDataObject.data.level3Score==null){
				addLock();
			}
			addPreviousButton();
			addNextButton();

			
		}

		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("background-orange"));
			addChild( menuBackground );
		}
		
		function addLock(){
			lock = new Image(Main.assets.getTexture("lock"));
			addChild(lock);
		}
		
		
		private function addPreviousButton(){
			previousButton = new Image(Main.assets.getTexture("ArrowsLeft")); 
			addChild( previousButton );
			
			previousButton.x = (Starling.current.stage.stageWidth - previousButton.width) * (1/20);
			previousButton.y = (Starling.current.stage.stageHeight - previousButton.height) * (1/2);
			
			previousButton.addEventListener( TouchEvent.TOUCH , onPreviousButton );
		}
		
		private function onPreviousButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "levelSelect", 1 );
				
			}
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
				Navigator.instance.loadScreen( "levelSelect3", 1 );
				
			}
		}
		
		
		private function addLevelFourButton(){
			if(MainMenuScreen.saveDataObject.data.level3Score>0){
				level4SelectButton = new Image(Main.assets.getTexture("Level4")); 
				addChild( level4SelectButton );
				
				level4SelectButton.x = (Starling.current.stage.stageWidth - level4SelectButton.width) * (1/4);
				level4SelectButton.y = (Starling.current.stage.stageHeight - level4SelectButton.height) * (1/3);
				
				level4SelectButton.addEventListener( TouchEvent.TOUCH , onLevelFourButton );
			}
			else{
				level4SelectButton = new Image(Main.assets.getTexture("Level4Grey")); 
				addChild( level4SelectButton );				
				level4SelectButton.x = (Starling.current.stage.stageWidth - level4SelectButton.width) * (1/4);
				level4SelectButton.y = (Starling.current.stage.stageHeight - level4SelectButton.height) * (1/3);
			}
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level4Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level4Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level4Score==3){
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
			star1.width=level4SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level4SelectButton.x-star1.width+3;
			star1.y=level4SelectButton.y+level4SelectButton.height+5;
			star2.x=level4SelectButton.x+3;
			star2.y=level4SelectButton.y+level4SelectButton.height+5;
			star3.x=level4SelectButton.x+star1.width+3;
			star3.y=level4SelectButton.y+level4SelectButton.height+5;
		}
		
		private function onLevelFourButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story", 4 );
				
			}
		}
		
		
		
		private function addLevelFiveButton(){			
			if(MainMenuScreen.saveDataObject.data.level4Score>0){
				level5SelectButton = new Image(Main.assets.getTexture("Level5")); 
				addChild( level5SelectButton );
				
				level5SelectButton.x = (Starling.current.stage.stageWidth - level5SelectButton.width) * (1/2);
				level5SelectButton.y = (Starling.current.stage.stageHeight - level5SelectButton.height) * (1/3);
				
				level5SelectButton.addEventListener( TouchEvent.TOUCH , onLevelFiveButton );
			}
			else{
				level5SelectButton = new Image(Main.assets.getTexture("Level5Grey")); 
				addChild( level5SelectButton );				
				level5SelectButton.x = (Starling.current.stage.stageWidth - level5SelectButton.width) * (1/2);
				level5SelectButton.y = (Starling.current.stage.stageHeight - level5SelectButton.height) * (1/3);
			}
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level5Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level5Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level5Score==3){
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
			star1.width=level5SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level5SelectButton.x-star1.width+3;
			star1.y=level5SelectButton.y+level5SelectButton.height+5;
			star2.x=level5SelectButton.x+3;
			star2.y=level5SelectButton.y+level5SelectButton.height+5;
			star3.x=level5SelectButton.x+star1.width+3;
			star3.y=level5SelectButton.y+level5SelectButton.height+5;
		}
		
		private function onLevelFiveButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 5);
			}
		}


		private function addLevelSixButton(){
			if(MainMenuScreen.saveDataObject.data.level5Score>0){
				level6SelectButton = new Image(Main.assets.getTexture("Level6")); 
				addChild( level6SelectButton );
				
				level6SelectButton.x = (Starling.current.stage.stageWidth - level6SelectButton.width) * (3/4);
				level6SelectButton.y = (Starling.current.stage.stageHeight - level6SelectButton.height) * (1/3);
				
				level6SelectButton.addEventListener( TouchEvent.TOUCH , onLevelSixButton );
			}
			else{
				level6SelectButton = new Image(Main.assets.getTexture("Level6Grey")); 
				addChild( level6SelectButton );				
				level6SelectButton.x = (Starling.current.stage.stageWidth - level6SelectButton.width) * (3/4);
				level6SelectButton.y = (Starling.current.stage.stageHeight - level6SelectButton.height) * (1/3);
			}
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level6Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level6Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level6Score==3){
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
			star1.width=level6SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level6SelectButton.x-star1.width+3;
			star1.y=level6SelectButton.y+level6SelectButton.height+5;
			star2.x=level6SelectButton.x+3;
			star2.y=level6SelectButton.y+level6SelectButton.height+5;
			star3.x=level6SelectButton.x+star1.width+3;
			star3.y=level6SelectButton.y+level6SelectButton.height+5;
		}
		
		private function onLevelSixButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 6);
			}
		}
		
		
		
	}
	
}
