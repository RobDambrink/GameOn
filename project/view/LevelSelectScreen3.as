package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.core.Starling;

	
	public class LevelSelectScreen3 extends Sprite{
		
		var previousButton:Image;
		var level1SelectButton:Image;
		var level2SelectButton:Image;
		var level3SelectButton:Image;
		var menuBackground:Image;
		
		public function LevelSelectScreen3() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("LevelSelectScreen 3 loaded");
			addMenuBackground();
			addLevelOneButton();
			addLevelTwoButton();
			addLevelThreeButton();
			addPreviousButton();
		}

		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("background-orange"));
			addChild( menuBackground );
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
			
			if(MainMenuScreen.saveDataObject.data.level7Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level7Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level7Score==3){
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
				Navigator.instance.loadScreen( "story", 7 );
				
			}
		}
		
		
		
		private function addLevelTwoButton(){
			level2SelectButton = new Image(Main.assets.getTexture("Level2")); 
			addChild( level2SelectButton );
			
			level2SelectButton.x = (Starling.current.stage.stageWidth - level2SelectButton.width) * (1/2);
			level2SelectButton.y = (Starling.current.stage.stageHeight - level2SelectButton.height) * (1/3);
			
			level2SelectButton.addEventListener( TouchEvent.TOUCH , onLevelTwoButton );
			
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level8Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level8Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level8Score==3){
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
				Navigator.instance.loadScreen( "story" , 8);
			}
		}


		private function addLevelThreeButton(){
			level3SelectButton = new Image(Main.assets.getTexture("Level3")); 
			addChild( level3SelectButton );
			
			level3SelectButton.x = (Starling.current.stage.stageWidth - level3SelectButton.width) * (3/4);
			level3SelectButton.y = (Starling.current.stage.stageHeight - level3SelectButton.height) * (1/3);
			
			level3SelectButton.addEventListener( TouchEvent.TOUCH , onLevelThreeButton );
			
			var star1:Image;
			var star2:Image;
			var star3:Image;
			
			if(MainMenuScreen.saveDataObject.data.level9Score==1){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level9Score==2){
				star1 = new Image(Main.assets.getTexture("Star"));
				star2 = new Image(Main.assets.getTexture("Star"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star1 );
				addChild( star2 );
				addChild( star3 );
			}
			else if(MainMenuScreen.saveDataObject.data.level9Score==3){
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
				Navigator.instance.loadScreen( "story" , 9);
			}
		}
	}
}
