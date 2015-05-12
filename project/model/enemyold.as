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
 
		private var stageRef:Stage;
		private var stopEnemy:Boolean=false;
		public var speed:Number =5; 
		public var dir:Number =2;
		
		private var relese:Boolean = false;
		private var releseCount:Number;
		public var target:Player;

        private var initX:Number;
		private var initY:Number;
		
		public function Enemy(stageRef:Stage, target:Player, X:Number,Y:Number,rC:Number) : void
		{
			this.stageRef = stageRef;
			this.target = target;
			
            //gotoAndStop("up");
			width=33;
			height=34;
			releseCount=rC;
			x =initX= X;
			y =initY= Y;
			
			//addEventListener(Event.ENTER_FRAME, loop, false, 1, true);
		}
		
		public function init(X:Number, Y:Number,d:Number=2,r:Boolean=false, st:Boolean=false):void
		{
			x =X;
			y =Y;
			relese=r;
			dir=d;
			stopEnemy=st;
			//gotoAndStop("up");
		}
 
		private function loop(e:Event) : void
		{ 
		
		  if(!stopEnemy)
		  {
			if(Engine.count<=releseCount)
			{
			    if(relese==false)
				{
				   var temp:Number;
				   if(x==275)
				   {
					  if(y==275) 
						 relese=true;
					  else
					   {
					     temp=y<275?1:-1;
					     y+=temp;
					   }
				    }
				    else
				    { 
					    temp=x<275?1:-1;
					    x+=temp;
				    }
				}

				   else
				   {
					   if(hitTestObject(target.hit))
			             playerDie();
				       movement();
				   }
				}
				
			}
			else
			{
				if(y<=335)
				 dir=+2;
				else if(y>=360)
				 dir=-2;
				y+=dir;
			}
		  }//end of first "if"
			 
		}
		
		
		//public function movement():void
		//{
		//	//movement of enemy this function is override in STI and sperm
		//}
		//private function enemyDie() : void 
		//{
		//	this.init(initX,initY);  
		//}
		//private function playerDie() : void 
		//{
		//	  Engine.life-=1;
		//}
	}
 
