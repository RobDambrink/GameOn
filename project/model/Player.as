package model {

	import starling.core.Starling;
	import starling.events.Event;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import flash.utils.setTimeout;
	import view.*;
	import starling.display.MovieClip;


	public class Player extends Sprite {

		public static var infected: Boolean;
		public static var gender: String;
		public var hit:Boolean=false;
		var player: Image
		
		var boyLeftAnimation:MovieClip;
		var boyRightAnimation:MovieClip;
		var boyUpAnimation:MovieClip;
		var boyDownAnimation:MovieClip;
		var girlLeftAnimation:MovieClip;
		var girlRightAnimation:MovieClip;
		var girlUpAnimation:MovieClip;
		var girlDownAnimation:MovieClip;


		public function Player(){
			this.addEventListener(Event.ENTER_FRAME, updateAnimation);
			gender = MainMenuScreen.saveDataObject.data.gender;

			trace("Gender: ", gender);
			
			player = new Image(Main.assets.getTexture("TileBoy"));
			//player = new Image(Main.assets.getTexture("TileGirl"));
			addChild(player);
		}
		
		
		function updateAnimation(event:Event){
			
//			if(gender=="male") {
//				//if(boyLeftAnimation.isComplete || boyRightAnimation.isComplete || boyUpAnimation.isComplete || boyDownAnimation.isComplete){
//					if(GameScreen.direction=="left"){
//						boyLeftAnimation = new MovieClip(Main.assets.getTextures("boyleft"),24);
//						addChild(boyLeftAnimation);
//						Starling.juggler.add(boyLeftAnimation);
//						boyLeftAnimation.play();
//						boyLeftAnimation.addEventListener(Event.COMPLETE, boyLeftCompleted);
//					}
//					if(GameScreen.direction=="right"){
//						boyRightAnimation = new MovieClip(Main.assets.getTextures("boyright"),24);
//						addChild(boyRightAnimation);
//						Starling.juggler.add(boyRightAnimation);
//						boyRightAnimation.play();
//					}
//					if(GameScreen.direction=="up"){
//						boyUpAnimation = new MovieClip(Main.assets.getTextures("boyback"),24);
//						addChild(boyUpAnimation);
//						Starling.juggler.add(boyUpAnimation);
//						boyUpAnimation.play();
//					}
//					if(GameScreen.direction=="down"){
//						boyDownAnimation = new MovieClip(Main.assets.getTextures("boyfront"),24);
//						addChild(boyDownAnimation);
//						Starling.juggler.add(boyDownAnimation);
//						boyDownAnimation.play();
//					}
//				//}
//			}
//			if (gender=="female"){
//				if(GameScreen.direction=="left"){
//					girlLeftAnimation = new MovieClip(Main.assets.getTextures("girl-left"),24);
//					addChild(girlLeftAnimation);
//					Starling.juggler.add(girlLeftAnimation);
//					girlLeftAnimation.play();
//				}
//				if(GameScreen.direction=="right"){
//					girlRightAnimation = new MovieClip(Main.assets.getTextures("girl-right"),24);
//					addChild(girlRightAnimation);
//					Starling.juggler.add(girlRightAnimation);
//					girlRightAnimation.play();
//				}
//				if(GameScreen.direction=="up"){
//					girlUpAnimation = new MovieClip(Main.assets.getTextures("girl-back"),24);
//					addChild(girlUpAnimation);
//					Starling.juggler.add(girlUpAnimation);
//					girlUpAnimation.play();
//				}
//				if(GameScreen.direction=="down"){
//					girlDownAnimation = new MovieClip(Main.assets.getTextures("girl-front"),24);
//					addChild(girlDownAnimation);
//					Starling.juggler.add(girlDownAnimation);
//					girlDownAnimation.play();
//				}
//			}
		}
		
		
		public function hitEnemy(){
			if(!hit){
				hit=true;
				infect();
			}
		}
		
		
		public function unHit(){
			if(hit){
				hit=false;
			}
		}
		
		
		public function infect(){
			if(!infected){
				infected=true;
				GameScreen.playerSpeed = 1;
			}
		}


		public function unInfect(){
			if(infected){
				infected=false;
				GameScreen.playerSpeed = 0.5;
			}
		}
	}
}
