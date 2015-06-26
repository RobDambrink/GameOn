package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.core.Starling;
	import model.*;
	import starling.display.MovieClip;
	
	public class ScoreScreen extends Sprite{
		
		public var score:int;
		var star1animation:MovieClip;
		var star2animation:MovieClip;
		var star3animation:MovieClip;
		public var animHeight:int = 67;
		public var animWidth:int = 67;
		var star1:Image;
		var star2:Image;
		var star3:Image;
		public static var currency:int;
		var starCount:int;
		var background:Image;
		var exitButton:Image;
		
		
		public function ScoreScreen(score:int) {
			this.score=score;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		

		private function onAddedToStage(event:Event)
		{
			trace("ScoreScreen loaded");
			trace("score achieved: ", score);
			addBackground();
			countStars();
			saveScore();
			addExitButton();
		}
		
		
		function addBackground(){
			background = new Image(Main.assets.getTexture("background-orange"));
			addChild(background);
		}
		
		
		function saveScore(){
			trace("Starcount: ", starCount);
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
		/*public function addStars(starCount:int){
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
			star1.y=Starling.current.stage.stageHeight*(1/3);
			star2.x=(Starling.current.stage.stageWidth - star2.width)*(1/2);
			star2.y=Starling.current.stage.stageHeight*(1/3);
			star3.x=(Starling.current.stage.stageWidth - star3.width)*(3/4);
			star3.y=Starling.current.stage.stageHeight*(1/3);
		}*/
		
		
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
				
				star1animation = new MovieClip(Main.assets.getTextures("star00"),24); // star spritesheet
				addChild(star1animation);
				Starling.juggler.add(star1animation);
				star1animation.height=animHeight;
				star1animation.width=animWidth;
				star1animation.loop=false;
				star1animation.play();
				star2 = new Image(Main.assets.getTexture("StarGrey"));
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star2 );
				addChild( star3 );
			}
			else if(starCount==2){
				star1animation = new MovieClip(Main.assets.getTextures("star00"),24); // star spritesheet
				addChild(star1animation);
				Starling.juggler.add(star1animation);
				star1animation.height=animHeight;
				star1animation.width=animWidth;
				star1animation.loop=false;
				star1animation.play();
				star2animation = new MovieClip(Main.assets.getTextures("star00"),24); // star spritesheet
				addChild(star2animation);
				Starling.juggler.add(star2animation);
				star2animation.height=animHeight;
				star2animation.width=animWidth;
				star2animation.loop=false;
				star2animation.play();
				star3 = new Image(Main.assets.getTexture("StarGrey"));
				addChild( star3 );
			}
			else if(starCount==3){
				star1animation = new MovieClip(Main.assets.getTextures("star00"),24); // star spritesheet
				addChild(star1animation);
				Starling.juggler.add(star1animation);
				star1animation.height=animHeight;
				star1animation.width=animWidth;
				star1animation.loop=false;
				star1animation.play();
				star2animation = new MovieClip(Main.assets.getTextures("star00"),24); // star spritesheet
				addChild(star2animation);
				Starling.juggler.add(star2animation);
				star2animation.height=animHeight;
				star2animation.width=animWidth;
				star2animation.loop=false;
				star2animation.play();
				star3animation = new MovieClip(Main.assets.getTextures("star00"),24); // star spritesheet
				addChild(star3animation);
				Starling.juggler.add(star3animation);
				star3animation.height=animHeight;
				star3animation.width=animWidth;
				star3animation.loop=false;
				star3animation.play();
			}
			if(star1){
				star1.x=(Starling.current.stage.stageWidth - star1.width)*(1/4);
				star1.y=Starling.current.stage.stageHeight*(1/3);
			}
			if(star2){
				star2.x=(Starling.current.stage.stageWidth - star2.width)*(1/2);
				star2.y=Starling.current.stage.stageHeight*(1/3);
			}
			if(star3){
				star3.x=(Starling.current.stage.stageWidth - star3.width)*(3/4);
				star3.y=Starling.current.stage.stageHeight*(1/3);
			}
			if(star1animation){
				star1animation.x=(Starling.current.stage.stageWidth - star1animation.width)*(1/4);
				star1animation.y=Starling.current.stage.stageHeight*(1/3);
			}
			if(star2animation){
				star2animation.x=(Starling.current.stage.stageWidth - star2animation.width)*(1/2);
				star2animation.y=Starling.current.stage.stageHeight*(1/3);
			}
			if(star3animation){
				star3animation.x=(Starling.current.stage.stageWidth - star3animation.width)*(3/4);
				star3animation.y=Starling.current.stage.stageHeight*(1/3);
			}
		}
		
		
		private function addExitButton(){
			exitButton = new Image(Main.assets.getTexture("ButtonExit")); 
			addChild( exitButton );			
			exitButton.x = (Starling.current.stage.stageWidth - exitButton.width)/2;
			exitButton.y = (Starling.current.stage.stageHeight - exitButton.height)*(3/4);			
			exitButton.addEventListener( TouchEvent.TOUCH , onExitButton );
		}
			
			
		private function onExitButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN){ 
				trace("klik");
				Navigator.instance.loadScreen( "levelSelect" ,0);
			}
		}
	}
}
