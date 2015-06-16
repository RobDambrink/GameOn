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
	import starling.text.TextField;
	
	public class GameScreen extends Sprite{
		
		var paused:Boolean;
		var mazeBackground:Image;
		var condomText:TextField;
		public static var player:Player = new Player();
		var exit:Exit = new Exit();
		var healthPellets:Vector.<HealthPellet> = new Vector.<HealthPellet>();
		var healthBar:HealthBar;
		var backButton:Image;
		var pauseMenu:Image;
		var pauseResume:Image;
		var pauseTutorial:Image;
		var pauseExit:Image;
		var xOffset:int = 9;
		var currentLevel:Array;
		var playerX:int;
		var playerY:int;
		var enemy1:Enemy = new Enemy();
		var enemy2:Enemy = new Enemy();
		public static var direction:String;
		public static var playerSpeed:Number = 0.5; // Adjust for speed of player. Lower number = faster, 0.5 is standard.
		var enemySpeed:Number = 0.5; // Adjust for speed of enemies. Lower number = faster, 0.5 is standard.
		var level:int;
		public static var condomCount:int;
		var items:Items;
		var timer:int=0;
		public static var thisLevel:int;
		var tween:Tween = new Tween(player,playerSpeed,"linear");
		var enemy1Tween:Tween = new Tween(enemy1,enemySpeed,"linear");
		var enemy2Tween:Tween = new Tween(enemy2,enemySpeed,"linear");
		var map:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 1
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,8,8,8,8,8,8,1,1,1,8,8,8,8,8,8,1],
			[1,8,8,1,1,1,8,8,8,8,8,1,1,1,8,8,1],
			[1,1,8,8,8,8,8,8,1,8,8,8,8,8,8,1,1],
			[1,8,8,8,1,0,8,0,0,0,8,0,1,8,8,8,1],
			[1,8,1,8,0,0,8,1,1,1,8,0,0,8,1,8,1],
			[1,8,8,8,1,8,8,8,1,8,8,8,1,8,8,8,1],
			[1,1,8,8,8,8,1,8,7,8,1,8,8,8,8,8,1],
			[4,4,4,4,4,4,4,4,9,4,4,4,4,4,4,4,4]
		];
		var map2:Array = [
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], // level 2
			[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
			[1,1,1,1,1,1,1,1,8,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,8,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,8,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,8,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,8,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,8,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,7,1,1,1,1,1,1,1,1],
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
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
			[1,0,6,0,0,0,0,0,0,0,0,0,0,0,7,0,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
		];
		
		// constructor code
		public function GameScreen(level:int){
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.level=level;
			thisLevel=level;
			trace("thisLevel: ", thisLevel);
		}
		
		//This function tells the console that the gamescreen is loaded. 
		private function onAddedToStage(event:Event){
			var swipe:SwipeGesture = new SwipeGesture(stage);
			swipe.addEventListener(GestureEvent.GESTURE_RECOGNIZED, onSwipeRec);
			this.addEventListener(Event.ENTER_FRAME, update);
		
			if(MainMenuScreen.saveDataObject.data.condomCount==null){
				MainMenuScreen.saveDataObject.data.condomCount = 0;
			}
			
			HealthBar.hp=20; 
			addMazeBackground();
			loadMap();
			loadPlayer(movementGrid);
			findEntities();
			addBackButton();
			placeHealthBar();
			placeItems(MainMenuScreen.saveDataObject.data.condomCount);
			updateHealthBar();

			
			condomText = new TextField(100,24,MainMenuScreen.saveDataObject.data.condomCount.toString());
			condomText.x = 48;
			condomText.y = 2;
			addChild(condomText);
		}
		
		private function update(e:Event){
			if(!paused){
				timer++;
				Starling.juggler.add(tween);
				Starling.juggler.add(enemy1Tween);
				Starling.juggler.add(enemy2Tween);
				if(tween.isComplete){
					tween.reset(player,playerSpeed,"linear");
					movementTest();
					tween.moveTo((playerY * 24)+xOffset , (playerX * 24));
				}
				if(enemy1Tween.isComplete){
					enemy1Tween.reset(enemy1,enemySpeed,"linear");
					enemyMovement(enemy1);
					enemy1Tween.moveTo((enemy1.enemyY * 24)+xOffset , (enemy1.enemyX * 24));
				}
				if(enemy2Tween.isComplete){
					enemy2Tween.reset(enemy2,enemySpeed,"linear");
					enemyMovement(enemy2);
					enemy2Tween.moveTo((enemy2.enemyY * 24)+xOffset , (enemy2.enemyX * 24));
				}
				collision();
			}
		}
		
		
		function findEntities(){
			for (var i:int = 0; i < map.length; i++){
				for (var j:int; j < map[i].length; j++){				
					if (movementGrid[i][j] == 5){
						playerX = i;
						playerY = j;
					}
					if (movementGrid[i][j] == 6){
						enemy1.enemyX = i;
						enemy1.enemyY = j;
					}
					if (movementGrid[i][j] == 7){
						enemy2.enemyX = i;
						enemy2.enemyY = j;
					}
				}
				j=0;
			}			
		}
    	
		
		function movementTest(){    
			if(direction==="down"){
				 if(checkPath(playerX+1,playerY)){
					 playerX+=1;
				 }
			 }
			 if(direction==="up"){
				 if(checkPath(playerX-1,playerY)){
					 playerX-=1;
				 }
			 }
			 if(direction==="left"){
				 if(checkPath(playerX,playerY-1)){
					 playerY-=1;
				 }
			 }
			 if(direction==="right"){
				 if(checkPath(playerX,playerY+1)){
					 playerY+=1;
				 }
			 }
		 }

				
		function loadMap(){
			if(level===1){
				currentLevel=this.map;
			}
			if(level===2){
				currentLevel=this.map2;
			}
			if(level===3){
				currentLevel=this.map3;
			}
			if(level===4){
				currentLevel=this.map4;
			}
			if(level===5){
				currentLevel=this.map5;
			}
			if(level===6){
				currentLevel=this.map6;
			}
			if(level===7){
				currentLevel=this.map7;
			}
			if(level===8){
				currentLevel=this.map8;
			}
			if(level===9){
				currentLevel=this.map9;
			}
			
			
			for(var row:int = 0; row < currentLevel.length; row++){
				for(var column:int = 0; column < currentLevel[row].length; column++){
					var data:int = currentLevel[row][column];
					if(data === 0) continue;
					var object:Sprite;
					if(data === 1){
						object = new Wall("Table");
					}
					if(data === 2){
						object = new Wall("Tree");
					}
					if(data === 3){
						object = new Wall("House");
					}
					if(data === 4){
						object = new Wall("Transparent");
					}
					if(data === 5){
						object=player;
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
					}
					var cellSize:int = object.width;
					if(object !== null){
						object.x = column * cellSize + xOffset;
						object.y = row * cellSize;
						addChild(object);
					}
				}
			}
		}
		
		
		function loadPlayer(map:Array){
			for(var row:int = 0; row < map.length; row++){
				for(var column:int = 0; column < map[row].length; column++){
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
					var cellSize:int = player.width;
					if(object !== null){
						object.x = column * cellSize + xOffset;
						object.y = row * cellSize;
						addChild(object);
					}
				}
			}
		}
		
		
		function checkPath(xcoord:int, ycoord:int){
			if(currentLevel[xcoord][ycoord]===0 || currentLevel[xcoord][ycoord]===8 || currentLevel[xcoord][ycoord]===7){			
				if (currentLevel[xcoord][ycoord]===8){ 
					var usedPellet:HealthPellet;
					for each(var healthPellet in healthPellets){
						if (player.getBounds(player.parent).intersects(healthPellet.getBounds(healthPellet.parent))){
							usedPellet = healthPellet;
							break;
						}
					}
					if (usedPellet){
						usedPellet.pelletTouched(usedPellet);
					}
					return true;
				}
				else{
					return true;
				}
			}
			return false;
		}
		
		
		function enemyMovement(user:Enemy){	
			if(user.enDir==="down"){
				 if(checkPath(user.enemyX+1,user.enemyY)){
					 user.enemyX+=1;
				 }
				 else{
					 user.enemyDirection();
				 }
			 }
			 if(user.enDir==="up"){
				 if(checkPath(user.enemyX-1,user.enemyY)){
					 user.enemyX-=1;
				 }
				 else{
					 user.enemyDirection();
				 }
			 }
			 if(user.enDir==="left"){
				 if(checkPath(user.enemyX,user.enemyY-1)){
					 user.enemyY-=1;
				 }
				 else{
					 user.enemyDirection();
				 }
			 }
			 if(user.enDir==="right"){
				 if(checkPath(user.enemyX,user.enemyY+1)){
					user.enemyY+=1;
				 }
				 else{
					 user.enemyDirection();
				 }
			 }
		}	
		
		
		/*
			This function checks if the player is colliding with a wall. If that is the case it will stop the player from moving and reposition the player.
		*/
		function collision(){								
			if(player.getBounds(player.parent).intersects(exit.getBounds(exit.parent))){
				if(HealthBar.hp>99){
					var score:int=14400-timer;
					//var score:int=timer;
					trace("=================GAME OVER YOU WIN=====================");
					Navigator.instance.loadScreen( "scoreScreen" ,score);
				}
			}
			if(player.getBounds(player.parent).intersects(enemy1.getBounds(enemy1.parent)) || player.getBounds(player.parent).intersects(enemy2.getBounds(enemy2.parent))){
				if(!player.hit && MainMenuScreen.saveDataObject.data.condomCount<1){				
					HealthBar.hp-=10;
					MainMenuScreen.saveDataObject.data.condomCount=0;
					timer+=240;
					player.hitEnemy();
					setTimeout(player.unHit, 2000);
					setTimeout(player.unInfect, 7000);
					trace(HealthBar.hp);
					updateHealthBar();
				}
				else if(!player.hit && MainMenuScreen.saveDataObject.data.condomCount>=1){
					MainMenuScreen.saveDataObject.data.condomCount--;
					
					removeChild(condomText,true);
					condomText = new TextField(100,24,MainMenuScreen.saveDataObject.data.condomCount.toString());
					condomText.x = 48;
					condomText.y = 2;
					addChild(condomText);
					
					player.hit=true;
					setTimeout(player.unHit, 2000);
				}
				
			}
		}		
		
		
		/**
			This method performs various actions based on the direction the user swiped in.
		*/
		function onSwipeRec(e:GestureEvent):void {
			var swipeGesture:SwipeGesture=e.target as SwipeGesture;
			if (swipeGesture.offsetX>6) {
				direction="right";
			}
			if (swipeGesture.offsetX<-6) {
				direction="left";
			}
			if (swipeGesture.offsetY>6) {
				direction="down";
			}
			if (swipeGesture.offsetY<-6) {
				direction="up";
			}
		}
		
		
		public function placeHealthBar(){
			healthBar = new HealthBar(this)
			healthBar.y = 2;
			healthBar.x = (Starling.current.stage.stageWidth - healthBar.width) / 2;
			addChild(healthBar);
		}
		
		
		public function placeItems(number:int){
			items = new Items();
			items.y = 2;
			items.x = (Starling.current.stage.stageWidth - items.width) / 8;
			addChild(items);
		}
		
		
		function addPauseMenu(){
			trace("Pause");
			
			pauseMenu = new Image(Main.assets.getTexture("PauseBackground")); 
			pauseMenu.x = (Starling.current.stage.stageWidth - pauseMenu.width)-((Starling.current.stage.stageWidth - pauseMenu.width) / 2);
			pauseMenu.y = 48;
			
			pauseResume = new Image(Main.assets.getTexture("Circle24")); 
			pauseResume.x = (Starling.current.stage.stageWidth - pauseResume.width)-((Starling.current.stage.stageWidth - pauseResume.width) / 2);
			pauseResume.y = 72;
			pauseResume.addEventListener( TouchEvent.TOUCH , onResumeButton );
			
			pauseTutorial = new Image(Main.assets.getTexture("Green24")); 
			pauseTutorial.x = (Starling.current.stage.stageWidth - pauseTutorial.width)-((Starling.current.stage.stageWidth - pauseTutorial.width) / 2);
			pauseTutorial.y = 96;
			pauseTutorial.addEventListener( TouchEvent.TOUCH , onTutorialButton );
			
			pauseExit = new Image(Main.assets.getTexture("Circle24")); 
			pauseExit.x = (Starling.current.stage.stageWidth - pauseExit.width)-((Starling.current.stage.stageWidth - pauseExit.width) / 2);
			pauseExit.y = 120;
			pauseExit.addEventListener( TouchEvent.TOUCH , onExitButton );
			
			addChild( pauseMenu );
			addChild( pauseResume );
			addChild( pauseTutorial );
			addChild( pauseExit );
		}
		
		
		private function onResumeButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				paused = false;
				removePauseMenu();
			}
		}
		
		
		private function onTutorialButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				trace("Tutorial");
			}
		}
		
		
		private function onExitButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen("mainMenu",0);
			}
		}
		
		
		function removePauseMenu(){
			trace("Unpause");
			removeChild( pauseMenu , true );
			removeChild( pauseResume , true );
			removeChild( pauseTutorial , true );
			removeChild( pauseExit , true );
		}
		
		
		private function addBackButton(){
			backButton = new Image(Main.assets.getTexture("BackButton")); 
			backButton.x = (Starling.current.stage.stageWidth - backButton.width)-((Starling.current.stage.stageWidth - backButton.width) * (1/32));
			backButton.y = 2;
			backButton.width -= 15;
			backButton.height = backButton.width;
			
			backButton.addEventListener( TouchEvent.TOUCH , onBackButton );
			addChild( backButton );
		}
		
		
		private function onBackButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				if(!paused){
					paused = true;
					addPauseMenu();
				}
				else{ 
					paused = false;
					removePauseMenu();
				}
			}
		}
		
		
		public function updateHealthBar(){
			healthBar.updateHealthBar();
		}
		
		
		public function removeHealthPellet(healthPellet:HealthPellet){
			healthPellet.hide(healthPellet);
			removeChild(healthPellet, true);
		}
		

		private function addMazeBackground(){
			var backGround:String;
			if(level==1 || level==2 || level==3){
				backGround="school";
			}
			if(level==4 || level==5 || level==6){
				backGround="background-orange";
			}			
			if(level==7 || level==8 || level==9){
				backGround="background-orange";
			}
			mazeBackground = new Image(Main.assets.getTexture(backGround));
			addChild(mazeBackground);
		}	
	}	
}
