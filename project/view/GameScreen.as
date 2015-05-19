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


	
	public class GameScreen extends Sprite{

		var toScoreScreenButton:Image;	
		var player:Player;
		var healthPellet:HealthPellet;
		var healthPellets:Vector.<HealthPellet> = new Vector.<HealthPellet>();
		var healthBar:HealthBar;
		//var enemy:Enemy;
		
		
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
			
			trace("GameScreen loaded");
			
			placeHealthBar();
			//placePellets();
			updateHealthBar();
			placePlayer();
			//placeEnemy();
			// GAME MECHANIC
			//addToScoreScreenButton();
		}
		
		function onSwipeRec(e:GestureEvent):void {
			trace ("onSwipeRec")
			var swipeGesture:SwipeGesture=e.target as SwipeGesture;
			if (swipeGesture.offsetX>6) {
				trace ("swipe");
				player.x += 20;

			}
			if (swipeGesture.offsetX<-6) {
				trace ("swipe more")
				player.x += -20;
			}
			
			if (swipeGesture.offsetY>6) {
				trace ("swipe");
				player.y += 20;

			}
			if (swipeGesture.offsetY<-6) {
				trace ("swipe more")
				player.y += -20;
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
