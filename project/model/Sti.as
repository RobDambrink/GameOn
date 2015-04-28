package model
{

	import starling.display.Stage;
	
	
	public class Sti extends Enemy
	{
       private var vx:Number = 0; 
	   private var vy:Number = 0; 
       private var graph:Graph1;
	   
		public function Sti(stageRef:Stage, target:Player) : void
		{
			super(stageRef, target,260,350,170);
			graph=new Graph1(this);
			graph.setDir(275,275,205,410);
		}
		
		override public function movement():void   //overriden from the enemy class
		{
			 if(x<=10 && dir==1)
					  x=580;
			  else if(x>=605 && dir==2)
					  x=35;
			
			vx=target.x;
			vy=target.y;
			
			if(Path.crossPath(x,y))
			   dir=graph.getDir();
			
			if(Path.crossPath(vx,vy))
			   graph.setDir2(vx,vy);
			
			//this moves enemy on the dir specified
			if (dir==1 )
			{
				if(Path.horizontalPath(x,y,dir))
				{
				  gotoAndStop("left");
				  x -= speed;
				}
			}
			else if (dir==2)
			{
				if(Path.horizontalPath(x,y,dir))
				{
				  gotoAndStop("right");
				  x += speed;
				}
			}
			else if (dir==3)
			{
				if(Path.verticalPath(x,y,dir))
				{
				  gotoAndStop("up");
				  y -= speed;
				}
			}
			else if (dir==4)
			{
				if(Path.verticalPath(x,y,dir))
				{
				  gotoAndStop("down");
				  y += speed;
				}
			}//end
		}
		
		
		
	}
}