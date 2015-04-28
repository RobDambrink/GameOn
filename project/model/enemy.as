package com.asgamer.eater
{
 
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.senocular.utils.KeyObject;
	import flash.display.Stage;
	import flash.ui.Keyboard;
    import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class Enemy extends MovieClip
	{
 
		private var stageRef:Stage;
		private var stopGhost:Boolean=false;
		public var speed:Number =5; 
		public var dir:Number =2;
		
		private var relese:Boolean = false;
		private var releseCount:Number;
		public var target:Eater;
		private var frightTimer:Timer;
		private var isFrighten:Boolean=false;
        private var initX:Number;
		private var initY:Number;
		// frightenning state variables
		private var adir:Number=2;
		private var nextPos:Number;
		private var frSpeed:Number=5;
		
		public function Enemy(stageRef:Stage, target:Eater, X:Number,Y:Number,rC:Number) : void
		{
			this.stageRef = stageRef;
			this.target = target;
			
            gotoAndStop("up");
			width=33;
			height=34;
			releseCount=rC;
			x =initX= X;
			y =initY= Y;
            frightTimer = new Timer(10000, 1);
			frightTimer.addEventListener(TimerEvent.TIMER, frightTimerHandler, false, 0, true);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function init(X:Number, Y:Number,d:Number=2,r:Boolean=false, st:Boolean=false):void
		{
			x =X;
			y =Y;
			relese=r;
			dir=d;
			stopGhost=st;
			gotoAndStop("up");
		}
 
		private function loop(e:Event) : void
		{ 
		
		  if(!stopGhost)
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
				   if(isFrighten==true)
				   {
					   if(hitTestObject(target.hit))
			             ghostDie();
					   frightening();
				   }
				   else
				   {
					   if(hitTestObject(target.hit))
			             pacmanDie();
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
		
		public function frighten():void 
		{
			if(relese==true)
			{
			  gotoAndStop("frighten");
			  frightTimer.start();
			  isFrighten=true;
			}
		}
		
		public function stopGhostFn(sX:Number=-100,sY:Number=-100):void
		{
			x=sX;
			y=sY;
			stopGhost=true;
		}
		
		
		//HANDLERS frightening time of ghosts
		private function frightTimerHandler(e:TimerEvent) : void
		{
			gotoAndStop("up");
			isFrighten=false;
		}
		
		private function frightening():void 
		{
			if (adir==1 )
			{
				if(Path.horizontalPath(this.x,this.y,adir))
				  this.x -= frSpeed;
				else
				 adir+=1;
			}
			else if (adir==2)
			{
				if(Path.horizontalPath(this.x,this.y,adir))
				  this.x += frSpeed;
				else
				 adir+=1;
			}
			else if (adir==3)
			{
				if(Path.verticalPath(this.x,this.y,adir))
				  this.y -= frSpeed;
				else
				 adir+=1;
			}
			else if (adir==4)
			{
				if(Path.verticalPath(this.x,this.y,adir))
				  this.y += frSpeed;
				else
				 adir+=1;
			}//end
			
			if(adir>4)
			adir=1;
			dir=adir;
		}
		public function movement():void
		{
			//movement of ghost this function is override in blinky and pinky class
		}
		private function ghostDie() : void 
		{
			this.init(initX,initY);  
		}
		private function pacmanDie() : void 
		{
			  Engine.life-=1;
		}
	}
 
}