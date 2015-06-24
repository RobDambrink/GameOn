package model
{
	import starling.core.Starling;
	import starling.events.Event;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import view.*;
	import starling.display.MovieClip;
	
	public class Enemy extends Sprite
	{ 		
		
		public var enemy:Image;
		public var enDir:String="";
		public var enemyX:int;
		public var enemyY:int;
		public var enemyType:String;
		public var enemyAnimation:MovieClip;
		public var animHeight:int = 24*Main.scaleFactor;
		public var animWidth:int = 24*Main.scaleFactor;
		
		public function Enemy(type:String){
			if(type=="SPERM"){ 
				enemyType=type;
				enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-down0000"),24);
				addChild(enemyAnimation);
				Starling.juggler.add(enemyAnimation);
				enemyAnimation.height=animHeight;
				enemyAnimation.width=animWidth;
				enemyAnimation.loop=false;
				enemyAnimation.play();
			}
			if(type=="STI"){ 
				enemyType=type;
				enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-down0000"),24); // CHANGE THIS SPRITESHEET FOR THE STI ONE
				addChild(enemyAnimation);
				Starling.juggler.add(enemyAnimation);
				enemyAnimation.height=animHeight; 
				enemyAnimation.width=animWidth;
				enemyAnimation.loop=false;
				enemyAnimation.play();
			}
			enemyDirection();
			addEventListener(Event.ENTER_FRAME, updateAnimation);
		}
		
		
		function updateAnimation(event:Event){
			if(enemyAnimation.isComplete){
				if(enDir=="left"){
					enemyAnimation.stop();
					removeChild(enemyAnimation);
					Starling.juggler.remove(enemyAnimation);
					if(enemyType=="SPERM"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-left"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(enemyType=="STI"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-left"),24); // CHANGE THIS SPRITESHEET FOR THE STI ONE
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
				}
				if(enDir=="right"){
					enemyAnimation.stop();
					removeChild(enemyAnimation);
					Starling.juggler.remove(enemyAnimation);
					if(enemyType=="SPERM"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-right"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(enemyType=="STI"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-right"),24); // CHANGE THIS SPRITESHEET FOR THE STI ONE
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
				}
				if(enDir=="up"){
					enemyAnimation.stop();
					removeChild(enemyAnimation);
					Starling.juggler.remove(enemyAnimation);
					if(enemyType=="SPERM"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-up"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(enemyType=="STI"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-up"),24); // CHANGE THIS SPRITESHEET FOR THE STI ONE
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
				}
				if(enDir=="down"){
					enemyAnimation.stop();
					removeChild(enemyAnimation);
					Starling.juggler.remove(enemyAnimation);
					if(enemyType=="SPERM"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-down"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(enemyType=="STI"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-down"),24); // CHANGE THIS SPRITESHEET FOR THE STI ONE
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
				}
				else if(enDir==""){
					enemyAnimation.stop();
					removeChild(enemyAnimation);
					Starling.juggler.remove(enemyAnimation);
					if(enemyType=="SPERM"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-down0000"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(enemyType=="STI"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("sperm-down0000"),24); // CHANGE THIS SPRITESHEET FOR THE STI ONE
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
				}
			}
		}
		
		
		public function enemyDirection(){
			var random:int=Math.random()*4;
			if(random==0){
				enDir="up";
			}
			else if(random==1){
				enDir="down";
			}
			else if(random==2){
				enDir="left";
			}
			else if(random==3){
				enDir="right";
			}
		}
	}
}