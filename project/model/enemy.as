package model
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.events.Timer
	import starling.display.Stage;
	import flash.ui.Keyboard;
    import flash.utils.Timer;
	import flash.events.TimerEvent;
	import starling.display.Sprite;
	import model.*;
	
	
	public class Enemy extends Sprite
	{ 
		private static final var initX:int = 50;
		private static final var initY:int = 50;
		
		private var x:int;
		private var y:int;
		
		private var walkSpeed:int;
		
		public function Enemy(){
			trace("constructor aangeroepen");
			walkSpeed=100;
			this.addEventListener(Event.ENTER_FRAME, touchPLayer);
			DelayedCall(pathfinding, 3);
		}
		
		public function touchPlayer(){
			if(this.hitTestObject(player){
				trace("hit hit hit");
				HealthBar.hp-=10;
				resetEnemy();
			}			
		}
		
		public function pathfinding(){
			trace("loop loop loop");
		}
		
		public function resetEnemy(){
			this.x=initX;
			this.y=initY;
			DelayedCall(pathfinding, 3);
		}
	}
 
