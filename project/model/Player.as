package model
{
 
	import starling.display.MovieClip;
	import starling.core.Starling;
	import starling.events.Event;
	import KeyObject;
	import starling.display.Stage;
	import flash.ui.Keyboard;
	import starling.display.Sprite;
	
	
	public class Player extends Sprite
	{
 
		private var scl:Number = 0;
		private var stopPlayer:Boolean=false;
		private var speed:Number =5;
		private var rotate:Number = 0;
		public var dir:Number =2;
		private var adir:Number =2;
		private var key:KeyObject;
		private var stageRef:Stage;
      
		public function Player (stageRef:Stage, X:Number=35, Y:Number=610,d:Number=2) : void
		{
			width=33;
			height=34;
			x =X;
			y =Y;
			dir=d;
			this.stageRef =stageRef;
			key = new KeyObject(stageRef);
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function init(X:Number=35, Y:Number=610,d:Number=2):void
		{
			x =X;
			y =Y;
			dir=d;
		}
 
		public function loop(e:Event) : void
		{
			
		  if(!stopPlayer)
		  {
			  if(x<=10 && dir==1)
					  x=580;
			  else if(x>=605 && dir==2)
					  x=35;
			
			  if (key.isDown(Keyboard.LEFT))
				  adir=1;
			  else if (key.isDown(Keyboard.RIGHT))
				  adir=2;
			  else if (key.isDown(Keyboard.UP))
				  adir=3;
			  else if (key.isDown(Keyboard.DOWN))
				  adir=4;
			
			 if(Path.crossPath(x,y) || checkReverse(dir,adir) && adir!=dir)
			 { 
			  if (adir==1 )
			   {
				if(Path.horizontalPath(x,y,adir))
				  dir=adir;
			   }
			  else if (adir==2)
			   {
				if(Path.horizontalPath(x,y,adir))
				  dir=adir;
			   }
			  else if (adir==3)
			   {
				if(Path.verticalPath(x,y,adir))
				  dir=adir;
			   }
			  else if (adir==4)
			  {
				if(Path.verticalPath(x,y,adir))
				  dir=adir;
			  }
			  
			}
			
			if (dir==1 )
			{
				if(Path.horizontalPath(x,y,dir))
				{
				  rotation=rotateCurrent();
				  scl=-1;
				  scaleX = -1;
				  x -= speed;
				}
			}
			else if (dir==2)
			{
				if(Path.horizontalPath(x,y,dir))
				{
				  rotation=rotateCurrent();
				  scl=1;
				  scaleX = 1;
				  x += speed;
				}
			}
			else if (dir==3)
			{
				if(Path.verticalPath(x,y,dir))
				{
				  if(scl==-1)
				  scaleX=1;
				  rotation=rotateCurrent();
				  rotation=-90;
				  rotate=-90;	
				  y -= speed;
				}
			}
			else if (dir==4)
			{
				if(Path.verticalPath(x,y,dir))
				{
				  if(scl==-1)
				  scaleX=1;
				  rotation=rotateCurrent();
				  rotation=90;
				  rotate=90;
				  y += speed;
				}
			}//end 
		  }//outer if end
		}
		
		public function rotateCurrent():Number
		{
			var value1:Number=rotate;
			rotate=0;
			if(value1==0)
			  return 0;
			else if(value1==90)
			  return -90;
			else if(value1==-90)
			  return 90;
			else
			  return 0;
		}
		
		public function checkReverse(X:Number, Y:Number):Boolean
        {
			if(X==1&& Y==2)
			return true;
			else if(X==2 && Y==1)
			return true;
			else if(X==3&& Y==4)
			return true;
			else if(X==4 && Y==3)
			return true;
			else
			return false;
	      return false;
        }
		
		public function stopPlayerFn(sX:Number=-100,sY:Number=-100):void
		{
			x=sX;
			y=sY;
			stopPlayer=true;
		}
		
	}
 
}