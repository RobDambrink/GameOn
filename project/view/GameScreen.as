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
	//import flash.geom.Point;

	
	public class GameScreen extends Sprite{

		var mazeBackground:Image;
		var toScoreScreenButton:Image;	
		public static var player:Player = new Player();
		var enemy1:Enemy = new Enemy();
		var enemy2:Enemy = new Enemy();
		var healthPellets:Vector.<HealthPellet> = new Vector.<HealthPellet>();
		var healthBar:HealthBar;
		var wall:Wall;
		var walls:Vector.<Wall> = new Vector.<Wall>();
		var playerX:int;
		var playerY:int;
		var lastSwipe:String;
		var direction:String;
		var enemyDirection:String;
		var memorySwipe:String;
		var map:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // UI
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,0,0,0,0,0,0,8,8,8,0,0,0,0,0,0,1],
			[1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1],
			[1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1],
			[0,0,0,0,1,1,0,1,0,1,0,1,1,0,0,0,0],
			[1,0,1,0,0,0,0,1,0,1,0,0,0,0,1,0,1],
			[1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
		];
		
		var movementGrid:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // UI
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1],
			[1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1],
			[0,0,0,0,1,1,0,1,0,1,0,1,1,0,0,0,0],
			[1,0,1,0,0,0,0,1,5,1,0,0,0,0,1,0,1],
			[1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1],
			[1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,6,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
		];
		
		
		// constructor code
		public function GameScreen() 
		{
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//This function tells the console that the gamescreen is loaded. 
		private function onAddedToStage(event:Event)
		{
			var swipe:SwipeGesture = new SwipeGesture(stage);
			swipe.addEventListener(GestureEvent.GESTURE_RECOGNIZED, onSwipeRec);
			this.addEventListener(Event.ENTER_FRAME, movement);
			
			
			trace("GameScreen loaded");
			//addMazeBackground();
			
			loadMap(map);
			loadPlayer(movementGrid);
			findPlayer();
			
			placeHealthBar();
			updateHealthBar();
			
//			this.addEventListener( Event.ENTER_FRAME , pelletCheck );
			this.addEventListener( Event.ENTER_FRAME , checkPelletCollision );

			//addToScoreScreenButton();
		}
		
		
		function findPlayer(){
			trace("findPlayer");	
			for (var i:int = 0; i < map.length; i++){
				for (var j:int; j < map[i].length; j++){				
					if (movementGrid[i][j] == 5){
						playerX=i;
						playerY=j;
					}
				}
				j=0;
			}
		}
				
		function loadMap(map:Array):void
		{
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
//					if(data === 6){
//						object = new Enemy();
//					}
//					if(data === 7){
//						object = new Exit();
//					}
					if(data === 8){
						object = new HealthPellet(this);
						healthPellets.push(object);
					}
										
					var cellSize:int = object.width;
					
					if(object !== null)
					{
						object.x = (column * cellSize) + (Main.scaleFactor * 9);
						object.y = row * cellSize;
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
					if(data===6){
						object=enemy1;
					}
					if(data===7){
						object=enemy2;
					}
					
					var cellSize:int = player.width;
					
					if(object !== null)
					{
						object.x = (column * cellSize) + (Main.scaleFactor * 9);
						object.y = row * cellSize;
						addChild(object);
					}
				}
			}
		}
		
	
		/*
			This function checks if any of the walls are currently colliding with the player. If so, the player is stopped from moving.
		*/
		function checkWallCollision(){
			for(var i:int; i<walls.length; i++){
				if(collision(walls[i])){
					direction="";
				}
			}
		}
		
		function checkPath(xcoord:int, ycoord:int){
			if(map[xcoord][ycoord]===1 || map[xcoord][ycoord]===2 || map[xcoord][ycoord]===3 || map[xcoord][ycoord]===4){
				//trace("muurtje1");
				if((memorySwipe!=="up" && lastSwipe==="down") || (memorySwipe!=="down" && lastSwipe==="up") || (memorySwipe!=="left" && lastSwipe==="right") || (memorySwipe!=="right" && lastSwipe==="left")){
					if(direction===memorySwipe){
							direction=lastSwipe;
						}
						else{
							direction=memorySwipe;
						}
				}
			}	
			else if(map[xcoord][ycoord]===0 || map[xcoord][ycoord]===8){
				
// Code to do something with the touched healthPellet.
				if (map[xcoord][ycoord]===8){ 
					var usedPellet:HealthPellet;
					for each(var healthPellet in healthPellets){
						trace(healthPellet);
						if (player.x == healthPellet.x && player.y == healthPellet.y){
							usedPellet = healthPellet;
							break;
						}
					}
					if (usedPellet){
						usedPellet.pelletTouched();
					}
				}
				
				if(ycoord===0 && lastSwipe==="left" && playerX===5 && playerY===1){
					movePlayer(5,15);
				}
				else if(lastSwipe==="right" && playerX===5 && playerY===15){
					movePlayer(5,1);
				}
				else{
				movePlayer(xcoord, ycoord);
				}
			}
		}
		
		public function movePlayer(xcoord:int, ycoord:int){
			movementGrid[playerX][playerY]=0;
			playerX=xcoord;
			playerY=ycoord;			
			movementGrid[xcoord][ycoord]=5;
			trace("x: ", xcoord, " y: ", ycoord);
			loadPlayer(movementGrid);
		}
		
		function movement(e:Event){		
			checkWallCollision();
			if(direction==="down"){
				//checkPath(playerX+1,playerY);
				player.y = player.y+player.getSpeed();
			}
			if(direction==="up"){
				//checkPath(playerX-1,playerY);				
				player.y = player.y-player.getSpeed();
			}
			if(direction==="left"){
				//checkPath(playerX,playerY-1);
				player.x = player.x-player.getSpeed();
			}
			if(direction==="right"){
				//checkPath(playerX,playerY+1);				
				player.x = player.x+player.getSpeed();
			}
		}
		
		
		
		
		
		
		function checkPelletCollision(e:Event){
			for(var i:int; i < healthPellets.length; i++){
				var usedPellet:HealthPellet;
				for each(var healthPellet in healthPellets){
					if (player.getBounds(player.parent).intersects(healthPellet.getBounds(healthPellet.parent))){
						usedPellet = healthPellet;
						break;
					}
				}
				if (usedPellet){
					usedPellet.pelletTouched();
				}
			}
		}
		





		
		/*
			This function checks if the player is colliding with a wall. If that is the case it will stop the player from moving and reposition the player.
		*/
		function collision(wall:Wall){
			if(player.getBounds(player.parent).intersects(wall.getBounds(wall.parent))){
				fixPlayer();
				direction="";
			}
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
				memorySwipe=lastSwipe;
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
		
		
		public function addToScoreScreenButton(){
			toScoreScreenButton = new Image(Main.assets.getTexture("ToScoreScreenButton"));
			addChild( toScoreScreenButton );
			
			toScoreScreenButton.y = 0;
			
			toScoreScreenButton.addEventListener( TouchEvent.TOUCH , onToScoreScreenButton );
		}
		
		public function onToScoreScreenButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "scoreScreen" );
			}
		}
		
		public function placeHealthBar(){
			healthBar = new HealthBar(this)
			healthBar.y = Main.scaleFactor * 2;
			healthBar.x = (Starling.current.stage.stageWidth - healthBar.width) / 2;
			addChild(healthBar);
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
		
		
		
		
		
//		public function placePellets(){
//			for (var i:int = 0; i < 5; i++)
//			{
//				healthPellet = new HealthPellet(this);
//				healthPellet.x = Math.random() * (Starling.current.stage.stageWidth - healthPellet.width);
//				healthPellet.y = Math.random() * (Starling.current.stage.stageHeight - healthPellet.height);
//
//				addChild(healthPellet);
//
//				healthPellets.push(healthPellet);
//			}
//		}
		
		public function removeHealthPellet(healthPellet:HealthPellet)
		{
			trace("remove healht pellet");
			removeChild(healthPellet, true);
			
//			//remove ball from vector list
//			var index:int = healthPellets.indexOf(healthPellet);
//			healthPellets.splice(index, 1);
//
//			if (healthPellets.length == 0)
//			{
//				trace("Opperdepop! Placing new pellets.");
//				placePellets();
//			}
		}
		
		private function addMazeBackground(){
			mazeBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild(mazeBackground);
		}
	
	}
	
}
