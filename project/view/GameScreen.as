package view{
	import starling.display.Sprite;	
	import starling.display.Stage;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.Event;
	import starling.events.TouchPhase;
	import starling.core.Starling;
	import org.gestouch.gestures.SwipeGesture;
	import org.gestouch.events.GestureEvent;
	import model.*;
	import flash.utils.setTimeout;
	import starling.animation.Tween;
	import starling.animation.Transitions;
	
	public class GameScreen extends Sprite{

		var mazeBackground:Image;
		var toScoreScreenButton:Image;	
		public static var player:Player = new Player();
		var exit:Exit = new Exit();
		var healthPellets:Vector.<HealthPellet> = new Vector.<HealthPellet>();
		var healthBar:HealthBar;
		var wall:Wall;
		var walls:Vector.<Wall> = new Vector.<Wall>();
		var bounces:Vector.<Wall> = new Vector.<Wall>();
		var backButton:Image;
		var playerX:int;
		var playerY:int;
		var enemy1:Enemy = new Enemy();
		var enemy2:Enemy = new Enemy();
		var lastSwipe:String;
		var direction:String;
		var memorySwipe:String;
		var level:int;
		var condomCount:int;
		var items:Items;
		var timer:int=0;
		var tween:Tween = new Tween(player, 0.4,"linear");
		var map:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 1
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,6,0,0,0,0,0,6,0,6,0,0,0,0,0,6,1],
			[1,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,1],
			[1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1],
			[1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1],
			[1,0,1,1,1,1,1,0,0,0,1,1,1,1,1,0,1],
			[1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1],
			[1,6,0,0,0,0,0,6,7,6,0,0,0,0,0,6,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];
		var map2:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 2
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];	
		var map3:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 3
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		];	
		var map4:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 4
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		];	
		var map5:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 5
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];	
		var map6:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 6
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];	
		var map7:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 7
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];	
		var map8:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 8
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];	
		var map9:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 9
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];	
		var movementGrid:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // UI
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,8,8,8,8,8,8,8,5,8,8,8,8,8,8,7,1],
			[1,8,1,8,1,8,8,8,1,8,8,8,1,8,1,8,1],
			[1,8,8,8,1,8,1,8,1,8,1,8,1,8,8,8,1],
			[1,8,8,8,8,8,1,8,8,8,1,8,8,8,8,8,1],
			[1,8,1,1,1,1,1,8,8,8,1,1,1,1,1,8,1],
			[1,8,1,1,1,1,1,8,1,8,1,1,1,1,1,8,1],
			[1,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
		];
		
		// constructor code
		public function GameScreen(level:int) 
		{
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.level=level;
			condomCount=1;
		}
		
		//This function tells the console that the gamescreen is loaded. 
		private function onAddedToStage(event:Event)
		{
			var swipe:SwipeGesture = new SwipeGesture(stage);
			swipe.addEventListener(GestureEvent.GESTURE_RECOGNIZED, onSwipeRec);
			//this.addEventListener( Event.ENTER_FRAME , checkPelletCollision );
			//this.addEventListener(Event.ENTER_FRAME, movement);	
			this.addEventListener(Event.ENTER_FRAME, update);
			
			trace("GameScreen loaded");
			addMazeBackground();
			
			loadMap();
			loadPlayer(movementGrid);
			findPlayer();
			addBackButton();
			placeHealthBar();
			placeItems(condomCount);
			HealthBar.hp=20;
			updateHealthBar();
			setTimeout(finish, 60000);
			
//			this.addEventListener( Event.ENTER_FRAME , pelletCheck );

			//addToScoreScreenButton();
		}
		
		public function finish(){
			var score:int=14400-timer;
			trace("=================GAME OVER YOU WIN=====================");
			Navigator.instance.loadScreen( "scoreScreen" ,score);
		}
		
		var playerXCoord:int;
		var playerYCoord:int;
		
		private function update(e:Event){
			timer++;
			Starling.juggler.add(tween);
			if(tween.isComplete){
				tween.reset(player,0.4,"linear");
				movementTest();
				trace("playerY: ", playerY, "playerX: ", playerX);
				tween.moveTo((playerY * 24) , (playerX * 24));
			}
		}
		
    	
   	 function movementTest(){    
   		 if(direction==="down"){
   			 if(checkPath(playerX+1,playerY, player, direction)){
   				 playerX+=1;
   			 }
   		 }
   		 if(direction==="up"){
   			 if(checkPath(playerX-1,playerY, player, direction)){
   				 playerX-=1;
   			 }
   		 }
   		 if(direction==="left"){
   			 if(checkPath(playerX,playerY-1, player, direction)){
   				 playerY-=1;
   			 }
   		 }
   		 if(direction==="right"){
   			 if(checkPath(playerX,playerY+1,player, direction)){
   				 playerY+=1;
   			 }
   		 }
   	 }
   	 

		
		function findPlayer(){
			playerX=(player.x) / 24;
			playerY= player.y / 24;
			trace("xcoord: ", playerXCoord, "ycoord: ", playerYCoord);			
		}
				
		function loadMap():void
		{
			var map:Array;
			if(level===1){
				map=this.map;
			}
			if(level===2){
				map=this.map2;
			}
			if(level===3){
				map=this.map3;
			}
			if(level===4){
				map=this.map4;
			}
			if(level===5){
				map=this.map5;
			}
			if(level===6){
				map=this.map6;
			}
			if(level===7){
				map=this.map7;
			}
			if(level===8){
				map=this.map8;
			}
			if(level===9){
				map=this.map9;
			}
			
			for(var row:int = 0; row < map.length; row++)
			{
				for(var column:int = 0; column < map[row].length; column++)
				{
					var data:int = map[row][column];
					
					// Data = 0: Path the player can walk on.
					// Empty tile, move onto the next item.
					if(data === 0) continue;
		
					var object:Sprite;
					
					if(data === 1){
						object = new Wall("House");
						walls.push(object);
					}
					if(data === 2){
						object = new Wall("Tree");
						walls.push(object);
					}
//					if(data === 3){
//						object = new Wall(table);
						//walls.push(object);
//					}
					if(data === 4){
						object = new Wall("Transparent");
						walls.push(object);
					}
					if(data === 5){
						object=player;
					}
					if(data === 6){
						object = new Wall("Bounce");
						bounces.push(object);
					}
					if(data === 7){
						object = exit;
					}
					if(data === 8){
						object = new HealthPellet(this);
						healthPellets.push(object);
					}
					if(data === 9){
						object = new Wall("Exit");
						walls.push(object);
					}
										
					var cellSize:int = object.width;
					
					if(object !== null)
					{
						object.x = (column * cellSize)+ 12; //
						object.y = (row * cellSize) + 12;
						addChild(object);
					}
				}
			}
		}
		
		function loadPlayer(map:Array):void
		{
			for(var row:int = 0; row < map.length; row++)
			{
				for(var column:int = 0; column < map[row].length; column++)
				{
					var data:int = map[row][column];
					
					if(data === 0) continue;
					if(data === 1) continue;
					
					var object:Sprite;

					if(data === 5){
						object=player;
					}
					if(data === 6){
						object=enemy1;
					}
					if(data === 7){
						object=enemy2;
					}
					if(data === 8){
						object = new HealthPellet(this);
						healthPellets.push(object);
					}
					
					var cellSize:int = player.width;
					
					if(object !== null)
					{
						object.x = (column * cellSize) + 12; //
						object.y = (row * cellSize) + 12;
						addChild(object);
					}
				}
			}
		}
		
	
		/*
			This function checks if any of the walls are currently colliding with the player. If so, the player is stopped from moving.
		*/
/*		function checkWallCollision(){
			for(var i:int; i<walls.length; i++){
				if(collision(walls[i])){
					direction="";
				}
			}
		}*/
		
function checkPath(ycoord:int, xcoord:int, user:Object, dir:String){
			var wallX:int;
			var wallY:int;
			if(map[ycoord][xcoord]===1 || map[ycoord][xcoord]===2 || map[ycoord][xcoord]===3 || map[ycoord][xcoord]===4 || map[ycoord][xcoord]===9){
				wallY=((ycoord * 24)+12);
				wallX=((xcoord * 24)+12); 
				
				if(dir==="up"){	
					if(user.y<=wallY+24){
						user.y=(wallY+24);
					}
					else{
						return true;
					}
				}				
				if(dir==="down"){	
					if(user.y>=wallY-24){
						user.y=(wallY-24);
					}
					else{
						return true;
					}
				}
				
				if(dir==="left"){	
					if(user.x<=wallX+24){		
						user.x=(wallX+24);
					}
					else{
						return true;
					}
				}
				
				if(dir==="right"){	
					if(user.x>=wallX-24){					
						user.x=wallX-24;
					}
					else{
						return true;
					}

				}
				
				
/*				if((memorySwipe!=="up" && lastSwipe==="down") || (memorySwipe!=="down" && lastSwipe==="up") || (memorySwipe!=="left" && lastSwipe==="right") || (memorySwipe!=="right" && lastSwipe==="left")){
					if(direction===memorySwipe){
							direction=lastSwipe;
						}
						else{
							direction=memorySwipe;
						}
				}*/
				if(user is Enemy){
					user.enemyDirection();
				}
				else if (user is Player){
					direction=memorySwipe;
				}
				return false;
			}	
/*			else if(map[xcoord][ycoord]===0 || map[xcoord][ycoord]===8){			
				if(ycoord===0 && lastSwipe==="left" && playerX===5 && playerY===1){
					movePlayer(5,15);
				}
				else if(lastSwipe==="right" && playerX===5 && playerY===15){
					movePlayer(5,1);
				}*/
//			else if(player.x==wallX && player.y==wallY){
//				direction = memorySwipe;
//				return true;
//			}
			else if(map[ycoord][xcoord]===0 || map[ycoord][xcoord]===9 || map[ycoord][xcoord]===7){
				return true;
			}
			
			else if(map[ycoord][xcoord]===6){
				direction=memorySwipe;
				memorySwipe=lastSwipe;
				return true;
			}
			

			return false;
		}


		

		
		public function movePlayer(xcoord:int, ycoord:int){
			trace("Fakka you from move player");

			movementGrid[playerX][playerY]=0;
			playerX=xcoord;
			playerY=ycoord;			
			movementGrid[xcoord][ycoord]=5;
			trace("x: ", xcoord, " y: ", ycoord);
			loadPlayer(movementGrid);
		}
		
		function movement(e:Event){	
//			enemyMovement(enemy1);
//			enemyMovement(enemy2);
			checkWalls(player);
			collision();
			playerXCoord= (player.x - 9) / 24 ;
			playerYCoord=player.y /24;
			//trace("xcoord: ", playerXCoord, "ycoord: ", playerYCoord);
			//trace("x: ", player.x, " y: ", player.y);
			//checkWallCollision();
			if(direction==="down"){
				if(checkPath(playerYCoord+1,playerXCoord, player, direction)){
					player.y = player.y+player.getSpeed();
				}
				checkBounce();
			}
			if(direction==="up"){
				if(checkPath(playerYCoord-1,playerXCoord, player, direction)){
					player.y = player.y-player.getSpeed();
				}
				checkBounce();		
			}
			if(direction==="left"){
				if(checkPath(playerYCoord,playerXCoord-1, player, direction)){
					player.x = player.x-player.getSpeed();
				}
				checkBounce();
			}
			if(direction==="right"){
				if(checkPath(playerYCoord,playerXCoord+1, player, direction)){
					player.x = player.x+player.getSpeed();
				}		
				checkBounce();
			}
		}
		
		function enemyMovement(user:Enemy){	
			var enemyX:int=(user.x - 9) / 24;
			var enemyY:int=user.y / 24;
			if(user.enDir==="down"){
				if(checkPath(enemyY+1,enemyX, user, user.enDir)){
					user.y = user.y+user.speed;
				}

			}
			if(user.enDir==="up"){
				if(checkPath(enemyY-1,enemyX, user, user.enDir)){
					user.y = user.y-user.speed;
				}				
		
			}
			if(user.enDir==="left"){
				if(checkPath(enemyY,enemyX-1, user, user.enDir)){
					user.x = user.x-user.speed;
				}
			}
			if(user.enDir==="right"){
				if(checkPath(enemyY,enemyX+1, user, user.enDir)){
					user.x = user.x+user.speed;
				}				
			}
		}	
		
		function checkWalls(user:Object){
			var xcoord= (player.x) / 24;
			var ycoord= player.y / 24;
			//for(var i:int; i < healthPellets.length; i++){
				//var usedPellet:HealthPellet;
			for each(var wall in walls){
				var wallY=((ycoord * 24) + 12);
				var wallX=((xcoord * 24) + 12);
				
					if((user.y<wallY+24) || (user.y>wallY-24) || (user.x<wallX+24) || (user.x>wallX-24)){
						if(direction==="up"){	
							user.y=(wallY+24);
						}
						if(direction==="down"){	
							user.y=(wallY-24);
						}
					
						if(direction==="left"){	
							user.x=(wallX+24);
						}
						
						if(direction==="right"){				
							user.x=wallX-24;
						}
					
						break;
					}
			}
				
			//	if (usedPellet){
				//	usedPellet.pelletTouched(usedPellet);
				//}
			//}
		}
		
		/*
			This function checks if the player is colliding with a wall. If that is the case it will stop the player from moving and reposition the player.
		*/
		function collision(){
			//if(player.getBounds(player.parent).intersects(wall.getBounds(wall.parent))){
			//	fixPlayer();
			//	trace("awrawhraorh");
			//	//direction="";
			//	if((memorySwipe!=="up" && lastSwipe==="down") || (memorySwipe!=="down" && lastSwipe==="up") || (memorySwipe!=="left" && lastSwipe==="right") || (memorySwipe!=="right" && lastSwipe==="left")){
			//		if(direction===memorySwipe){
			//			direction=lastSwipe;
			//		}
			//		else{
			//			direction=memorySwipe;
			//		}
			//	}
			//}
			for each(var healthPellet in healthPellets){
				if (player.getBounds(player.parent).intersects(healthPellet.getBounds(healthPellet.parent))){
					healthPellet.pelletTouched(healthPellet);
					break;
				}
			}
					
			if(player.getBounds(player.parent).intersects(exit.getBounds(exit.parent))){
				if(HealthBar.hp>99){
					var score:int=14400-timer;
					trace("=================GAME OVER YOU WIN=====================");
					Navigator.instance.loadScreen( "scoreScreen" ,score);
				}
			}
			if(player.getBounds(player.parent).intersects(enemy1.getBounds(enemy1.parent)) || player.getBounds(player.parent).intersects(enemy2.getBounds(enemy2.parent))){
				if(!player.hit && condomCount<=0){				
					HealthBar.hp-=10;
					condomCount=0;
					timer+=240;
					player.hit=true;
					setTimeout(player.unHit, 2000);
					trace(HealthBar.hp);
					updateHealthBar();
				}
				else if(!player.hit && condomCount>=1){
					condomCount--;
					player.hit=true;
					setTimeout(player.unHit, 2000);
				}
			}

//			for each(var bounce in bounces){
//				//trace("bounce.y: ",bounce.y,"bounce.x: ", bounce.x);
//				if(checkPath(player.y/24, player.x/24, player, lastSwipe)){
//					trace("bounce 1");
//					if (player.x===bounce.x && player.y===bounce.y){
//						trace("bounce hit");
//						if(direction!==null){
//							direction=memorySwipe;
//						}
//						break;
//					}
//				}
//			}
			

		}		
		
		/*
			This function relocates the player after collision with a wall to ensure that there is no longer collision.
		*/
		function fixPlayer(){
			if(direction==="down"){
				player.y -= Player.speed;
			}
			if(direction==="up"){
				player.y += Player.speed;
			}
			if(direction==="left"){
				player.x += Player.speed;
			}
			if(direction==="right"){
				player.x -= Player.speed;
			}
		}
		
		/**
			This method performs various actions based on the direction the user swiped in.
		*/
		function onSwipeRec(e:GestureEvent):void {
			var swipeGesture:SwipeGesture=e.target as SwipeGesture;
			if(lastSwipe!==null){
				trace("Memory set");
				//memorySwipe=lastSwipe;
			}
			//right
			if (swipeGesture.offsetX>6) {
				trace ("swipe right");
				lastSwipe="right";
				direction="right";
				//checkPath(playerX, playerY+1);
			}
			//left
			if (swipeGesture.offsetX<-6) {
				trace ("swipe left")
				lastSwipe="left";
				direction="left";
				//checkPath(playerX, playerY-1);	
			}
			//downwards
			if (swipeGesture.offsetY>6) {
				trace ("swipe down");
				lastSwipe="down";
				direction="down";
				//checkPath(playerX+1, playerY);
			}
			//upwards
			if (swipeGesture.offsetY<-6) {
				trace ("swipe up");
				lastSwipe="up";
				direction="up";
				//movement
				//checkPath(playerX-1, playerY);
			}
			trace(memorySwipe, " ", lastSwipe);
		}
		
		
		public function checkBounce(){
			for each(var bounce in bounces){
				if(player.x===bounce.x && player.y===bounce.y){
					trace("bouncerino");
/*					if((memorySwipe!=="up" && direction==="down") || (memorySwipe!=="down" && direction==="up") || (memorySwipe!=="left" && direction==="right") || (memorySwipe!=="right" && direction==="left")){
						if(direction===memorySwipe){
							direction=lastSwipe;
						}
						else{
							direction=memorySwipe;
						}*/
					//}
					break;
				}
			}
		}

		
		public function addToScoreScreenButton(){
			toScoreScreenButton = new Image(Main.assets.getTexture("ToScoreScreenButton"));
			addChild( toScoreScreenButton );
			
			toScoreScreenButton.y = 0;
			
			toScoreScreenButton.addEventListener( TouchEvent.TOUCH , onToScoreScreenButton );
		}
		
		public function onToScoreScreenButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN){ 
				Navigator.instance.loadScreen( "scoreScreen" ,0);
			}
		}
		
		public function placeHealthBar(){
			healthBar = new HealthBar(this)
			healthBar.y = 2;
			healthBar.x = (Starling.current.stage.stageWidth - healthBar.width) / 2;
			addChild(healthBar);
		}
		
		public function placeItems(number:int){
			items = new Items(number);
			items.y = 2;
			items.x = (Starling.current.stage.stageWidth - items.width) / 8;
			addChild(items);
		}
		
		private function addBackButton(){
			backButton = new Image(Main.assets.getTexture("BackButton")); 
			
			backButton.x = (Starling.current.stage.stageWidth - backButton.width)-((Starling.current.stage.stageWidth - backButton.width) / 8);
			backButton.y = 2;
			
			backButton.addEventListener( TouchEvent.TOUCH , onBackButton );
			addChild( backButton );
		}
		
		private function onBackButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				//go back.
				trace("Back button is pressed.");
			}
		}
		
		public function placePlayer(){
			trace ("placePlayer")
			player = new Player();
			player.x = Math.random() * (Starling.current.stage.stageWidth - player.width);
			player.y = Math.random() * (Starling.current.stage.stageHeight - player.height);
			addChild(player);
		}
		
		public function updateHealthBar(){
			healthBar.updateHealthBar();
		}
		
		public function removeHealthPellet(healthPellet:HealthPellet){
			trace("remove healht pellet");
			healthPellet.hide(healthPellet);
			removeChild(healthPellet, true);
		}
		

		private function addMazeBackground(){
			mazeBackground = new Image(Main.assets.getTexture("school"));
			addChild(mazeBackground);
		}	
	}	
}
