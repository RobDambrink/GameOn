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
		public var enemyAnimation:MovieClip;
		public var animHeight:int = 24*Main.scaleFactor;
		public var animWidth:int = 24*Main.scaleFactor;
		
		public function Enemy(){
			
			if(Player.gender=="male"){
				enemyAnimation = new MovieClip(Main.assets.getTextures("boy-front0000"),24);
				addChild(enemyAnimation);
				Starling.juggler.add(enemyAnimation);
				enemyAnimation.height=animHeight;
				enemyAnimation.width=animWidth;
				enemyAnimation.loop=false;
				enemyAnimation.play();				
			}
			if(Player.gender=="female"){
				enemyAnimation = new MovieClip(Main.assets.getTextures("girl-front0000"),24);
				addChild(enemyAnimation);
				Starling.juggler.add(enemyAnimation);
				enemyAnimation.height=animHeight; 
				enemyAnimation.width=animWidth;
				enemyAnimation.loop=false;
				enemyAnimation.play();
			}
			
//			enemy = new Image(Main.assets.getTexture("sti"));
//			addChild(enemy);
			
			enemyDirection();
			
			addEventListener(Event.ENTER_FRAME, updateAnimation);
		}
		
		
		function updateAnimation(event:Event){
			if(enemyAnimation.isComplete){
				if(enDir=="left"){
					enemyAnimation.stop();
					removeChild(enemyAnimation);
					Starling.juggler.remove(enemyAnimation);
					if(Player.gender=="male"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("boy-left"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(Player.gender=="female"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("girl-left"),24);
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
					if(Player.gender=="male"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("boy-right"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(Player.gender=="female"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("girl-right"),24);
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
					if(Player.gender=="male"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("boy-back"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(Player.gender=="female"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("girl-back"),24);
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
					if(Player.gender=="male"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("boy-front"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(Player.gender=="female"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("girl-front"),24);
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
					if(Player.gender=="male"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("boy-front0000"),24);
						addChild(enemyAnimation);
						Starling.juggler.add(enemyAnimation);
						enemyAnimation.height=animHeight; 
						enemyAnimation.width=animWidth;
						enemyAnimation.loop=false;
						enemyAnimation.play();
					}
					if(Player.gender=="female"){
						enemyAnimation = new MovieClip(Main.assets.getTextures("girl-front0000"),24);
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