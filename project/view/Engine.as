package view
{
	import starling.core.Starling;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Engine extends Sprite 
	{
		private var scoreHUD:ScoreHUD;
		public static var count:Number=0;
		public static var life:Number=0;
		public static var curLife:Number=3;
		private var eater:Eater;
		private var blinky:Enemy;
		public var pinky:Enemy;
		private var dotList:Array;
		private var p:Path;
		public function Engine() : void
		{
			dotList = new Array();//stores All Dots
			scoreHUD = new ScoreHUD(stage); //create our HUD
			eater = new Eater(stage); //Pacman instance
			p=new Path();
			blinky = new Blinky(stage,eater);//blinky instance
			pinky = new Pinky(stage,eater);//pinky instance
			life=3;
			stage.addChild(scoreHUD); //adding HUD On the stage.
			for(var i:Number=35;i<=580;i+=20) //adding all the dots on the stage and push them in array to count them.
			{
				for(var j:Number=70;j<=610;j+=20)
				{
					if(Path.horizontalPath(i,j,2) || Path.verticalPath(i,j,4))
					{
						var dot:Dots = new Dots(stage,eater,i,j,blinky,pinky);
						count+=1;
						stage.addChild(dot);
						dotList.push(dot);
					}
				}
			}
			stage.addChild(eater);//adding pacman to stage
			stage.addChild(blinky);//adding blinky to stage
			stage.addChild(pinky);//adding pinky to stage
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);//keep on calling loop function on each frame entered
		}
		
		public function loop(e:Event):void //checking how much dots does the pacman has eaten
		{
			if(count<=0)
			  levelComplete(); //if all the dots have been eaten call the level complete function
			if(life<0)
			{
			   stopGame();	
			  gotoAndStop(2);
			}
			else if(life<curLife)
			{
			  curLife=life;	
			  scoreHUD.updateLife(life);
			  reset();
			}
		}
		
		public function levelUp():void 
		{
			count=0;
			scoreHUD.updateLevel();
			for(var i in dotList)  // regenerate the dots
			{
						count+=1;
						var dot:Dots = dotList[i];
						dot.init();
			}
			reset();
			
		}//end level up
		
        private function levelComplete():void
        {
			 
			 levelUp(); //reinitialize the game 
		}
		
		private function reset():void
		{
			eater.init(); //set pacman to initial position
			blinky.init(260,350); // set blinky to initial position
			pinky.init(325,350); // set pinky to initial position
		}
		private function stopGame():void
		{
			life=3;
			curLife=life;
			eater.stopPacmanFn();		
			blinky.stopGhostFn();	
			pinky.stopGhostFn();
			scoreHUD.resetHUD();
			for(var i in dotList)  // regenerate the dots
			{
						count+=1;
						var dot:Dots = dotList[i];
						dot.hidDot();
			}
		}
		
	}
}