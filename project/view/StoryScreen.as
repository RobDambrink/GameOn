package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import flash.utils.setTimeout;
	
	public class StoryScreen extends Sprite{
		
		private var level:int;

		public function StoryScreen(level:int) {
			// constructor code
			this.level=level;
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event){
			trace("comic loaded");
			var comicNumber:String;
			if(level===1){
				comicNumber="comic1.1";
			}
			if(level===2){
				comicNumber="comic1.2";
			}
			if(level===3){
				comicNumber="comic1.2";
			}
			if(level===4){
				comicNumber="comic1.2";
			}
			if(level===5){
				comicNumber="comic1.2";
			}
			if(level===6){
				comicNumber="comic1.2";
			}
			if(level===7){
				comicNumber="comic1.2";
			}
			if(level===8){
				comicNumber="comic1.2";
			}
			if(level===9){
				comicNumber="comic1.2";
			}
			
			var comic:Image = new Image(Main.assets.getTexture(comicNumber));
			addChild(comic);
			//10 second timer before the level is started
			trace("timer started");
			setTimeout(startLevel, 1000);
		}

		
		public function startLevel(){
			trace("loading level", level);
			Navigator.instance.loadScreen("game",level);
		}
	}	
}
