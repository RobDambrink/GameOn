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
		var level7SelectButton:Image;
		var level8SelectButton:Image;
		var level9SelectButton:Image;
		var menuBackground:Image;
		var lock:Image;
		
		public function LevelSelectScreen3() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("LevelSelectScreen 3 loaded");
			addMenuBackground();
			addLevelSevenButton();
			addLevelEightButton();
			addLevelNineButton();
			if(MainMenuScreen.saveDataObject.data.level6Score==0 || MainMenuScreen.saveDataObject.data.level6Score==null){
				addLock();
			}
			addPreviousButton();
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
				Navigator.instance.loadScreen( "levelSelect2", 1 );
				
			}
		}
		
		private function addLevelSevenButton(){
			if(MainMenuScreen.saveDataObject.data.level6Score>0){
				level7SelectButton = new Image(Main.assets.getTexture("Level7")); 
				addChild( level7SelectButton );
				
				level7SelectButton.x = (Starling.current.stage.stageWidth - level7SelectButton.width) * (1/4);
				level7SelectButton.y = (Starling.current.stage.stageHeight - level7SelectButton.height) * (1/3);
				
				level7SelectButton.addEventListener( TouchEvent.TOUCH , onLevelSevenButton );
			}
			else{
				level7SelectButton = new Image(Main.assets.getTexture("Level7Grey")); 
				addChild( level7SelectButton );				
				level7SelectButton.x = (Starling.current.stage.stageWidth - level7SelectButton.width) * (1/4);
				level7SelectButton.y = (Starling.current.stage.stageHeight - level7SelectButton.height) * (1/3);
			}
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
			star1.width=level7SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level7SelectButton.x-star1.width+3;
			star1.y=level7SelectButton.y+level7SelectButton.height+5;
			star2.x=level7SelectButton.x+3;
			star2.y=level7SelectButton.y+level7SelectButton.height+5;
			star3.x=level7SelectButton.x+star1.width+3;
			star3.y=level7SelectButton.y+level7SelectButton.height+5;
		}
		
		private function onLevelSevenButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story", 7 );
				
			}
		}
		
		
		
		private function addLevelEightButton(){
			if(MainMenuScreen.saveDataObject.data.level7Score>0){
				level8SelectButton = new Image(Main.assets.getTexture("Level8")); 
				addChild( level8SelectButton );
				
				level8SelectButton.x = (Starling.current.stage.stageWidth - level8SelectButton.width) * (1/2);
				level8SelectButton.y = (Starling.current.stage.stageHeight - level8SelectButton.height) * (1/3);
				
				level8SelectButton.addEventListener( TouchEvent.TOUCH , onLevelEightButton );
			}
			else{
				level8SelectButton = new Image(Main.assets.getTexture("Level8Grey")); 
				addChild( level8SelectButton );				
				level8SelectButton.x = (Starling.current.stage.stageWidth - level8SelectButton.width) * (1/2);
				level8SelectButton.y = (Starling.current.stage.stageHeight - level8SelectButton.height) * (1/3);
			}
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
			star1.width=level8SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level8SelectButton.x-star1.width+3;
			star1.y=level8SelectButton.y+level8SelectButton.height+5;
			star2.x=level8SelectButton.x+3;
			star2.y=level8SelectButton.y+level8SelectButton.height+5;
			star3.x=level8SelectButton.x+star1.width+3;
			star3.y=level8SelectButton.y+level8SelectButton.height+5;
		}
		
		private function onLevelEightButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 8);
			}
		}


		private function addLevelNineButton(){
			if(MainMenuScreen.saveDataObject.data.level8Score>0){			
				level9SelectButton = new Image(Main.assets.getTexture("Level9")); 
				addChild( level9SelectButton );
				
				level9SelectButton.x = (Starling.current.stage.stageWidth - level9SelectButton.width) * (3/4);
				level9SelectButton.y = (Starling.current.stage.stageHeight - level9SelectButton.height) * (1/3);
				
				level9SelectButton.addEventListener( TouchEvent.TOUCH , onLevelNineButton );
			}
			else{
				level9SelectButton = new Image(Main.assets.getTexture("Level9Grey")); 
				addChild( level9SelectButton );
				level9SelectButton.x = (Starling.current.stage.stageWidth - level9SelectButton.width) * (3/4);
				level9SelectButton.y = (Starling.current.stage.stageHeight - level9SelectButton.height) * (1/3);
			}
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
			star1.width=level9SelectButton.width-8;
			star1.height=star1.width;
			star2.width=star1.width;
			star2.height=star1.width;
			star3.width=star1.width;
			star3.height=star1.width;
			
			star1.x=level9SelectButton.x-star1.width+3;
			star1.y=level9SelectButton.y+level9SelectButton.height+5;
			star2.x=level9SelectButton.x+3;
			star2.y=level9SelectButton.y+level9SelectButton.height+5;
			star3.x=level9SelectButton.x+star1.width+3;
			star3.y=level9SelectButton.y+level9SelectButton.height+5;
		}
		
		private function onLevelNineButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "story" , 9);
			}
		}
	}
}
