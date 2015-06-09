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
	
	
	public class Enemy extends Sprite
	{ 
		
		
		public var speed:int=3*Main.scaleFactor;
		public var enemy:Image;
		public var enDir:String="";
		
		public function Enemy(){
			trace("enemy constructor aangeroepen");
			enemy = new Image(Main.assets.getTexture("sti"));
			enemyDirection();
			
			enemy.alignPivot();
			addChild(enemy);
		}
		
		public function enemyDirection(){
			var random:int=Math.random()*4;
			if(random===0){
				enDir="up";
			}
			else if(random===1){
				enDir="down";
			}
			else if(random===2){
				enDir="left";
			}
			else if(random===3){
				enDir="right";
			}
		}
		
		

	}
 
}