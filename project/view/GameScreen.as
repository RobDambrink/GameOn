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

		var toScoreScreenButton:Image;	
		var player:Player;
		var healthPellet:HealthPellet;
		var healthPellets:Vector.<HealthPellet> = new Vector.<HealthPellet>();
		var healthBar:HealthBar;
		var wall:Wall;
		//var walls:Vector.<Wall> = new Vector.<Wall>();
		//var enemy:Enemy;
		var map:Array = [
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,0,1,1,0,1,0,1,0,1,1,1,1,1],
			[1,0,1,1,0,1,0,1,0,1,1,1,1,1],
			[1,0,0,1,0,0,0,1,0,0,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			[1,0,0,0,0,0,0,0,0,0,1,1,1,1],
			[1,1,1,1,1,1,1,1,1,1,1,1,1,1]
		];
		
		// constructor code
		public function GameScreen() 
		{
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//This function tells the console that the gamescreen is loaded. Also adds the background to the stage. The function addConditionMet is delayed for 2 seconds, then executes.
		private function onAddedToStage(event:Event)
		{
			var swipe:SwipeGesture = new SwipeGesture(stage);
			swipe.addEventListener(GestureEvent.GESTURE_RECOGNIZED, onSwipeRec);
			//this.addEventListener(Event.ENTER_FRAME, collision);
			
			trace("GameScreen loaded");
			
			loadMap(map);
			
			//placeHealthBar();
			//placePellets();
			//updateHealthBar();
			//placePlayer();
			//placeWall();
			//placeEnemy();
			//addToScoreScreenButton();
		}
		
		
		function loadMap(map:Array, cellSize:int = 30):void
		{
			for(var row:int = 0; row < map.length; row++)
			{
				for(var column:int = 0; column < map[row].length; column++)
				{
					var data:int = map[row][column];
		
					// Empty tile, move onto the next item.
					if(data === 0) continue;
		
		
					var object:Sprite;
		
					if(data === 1){
						object = new Wall();
					}
/*					if(data === 2){
						object = new Wall();
					}
					if(data === 3){
						object = new Wall();
					}
					if(data === 4){
						object = new Wall();
					}
*/		
					if(object !== null)
					{
						object.x = column * cellSize;
						object.y = row * cellSize;
						addChild(object);
					}
				}
			}
		}
		
		
		
/*		function collision(){
//			if(player.hitTest(wall)){
//				player.hitWall();
//			}

			if(player.getBounds(player.parent).intersects(wall.getBounds(wall.parent))){
				player.hitWall();
			}
			
		}
*/		
		/**
			This method performs various actions based on the direction the user swiped in.
		*/
		function onSwipeRec(e:GestureEvent):void {
			trace ("onSwipeRec")
			var swipeGesture:SwipeGesture=e.target as SwipeGesture;
			if (swipeGesture.offsetX>6) {
				trace ("swipe");
				player.x += player.speed;

			}
			if (swipeGesture.offsetX<-6) {
				trace ("swipe more")
				player.x -= player.speed;
			}
			
			if (swipeGesture.offsetY>6) {
				trace ("swipe");
				player.y += player.speed;

			}
			if (swipeGesture.offsetY<-6) {
				trace ("swipe more")
				player.y -= player.speed;
			}
		}
	
		
		private function addToScoreScreenButton(){
			toScoreScreenButton = new Image(Main.assets.getTexture("ToScoreScreenButton"));
			addChild( toScoreScreenButton );
			
			toScoreScreenButton.y = 0;
			
			toScoreScreenButton.addEventListener( TouchEvent.TOUCH , onToScoreScreenButton );
		}
		
		private function onToScoreScreenButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "scoreScreen" );
			}
		}

		
		public function placeWall(){
			wall= new Wall();
			//place the wall in the center of the screen
			wall.x=Starling.current.stage.stageWidth/2;
			wall.y=Starling.current.stage.stageHeight/2;
			
			// REMOVE THIS COMMENTS TO TEST THE HITTESTWALL
			//wall.x = player.x;
			//wall.y = player.y;			

			addChild(wall);
		}
		
		public function placePellets()
		{
			for (var i:int = 0; i < 5; i++)
			{
				healthPellet = new HealthPellet(this);
				healthPellet.x = Math.random() * (Starling.current.stage.stageWidth - healthPellet.width);
				healthPellet.y = Math.random() * (Starling.current.stage.stageHeight - healthPellet.height);

				addChild(healthPellet);

				healthPellets.push(healthPellet);
			}
		}
		
		public function placeHealthBar(){
			healthBar = new HealthBar(this)
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
		
		public function removeHealthPellet(healthPellet:HealthPellet)
		{
			removeChild(healthPellet, true);

			//remove ball from vector list
			var index:int = healthPellets.indexOf(healthPellet);
			healthPellets.splice(index, 1);

			if (healthPellets.length == 0)
			{
				trace("Opperdepop! Placing new pellets.");
				placePellets();
			}
		}
		
	
	}
	
}
