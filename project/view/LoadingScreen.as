package view {
	import starling.events.Event;
	import starling.display.Sprite;
	import starling.core.Starling;
	import starling.textures.Texture;
	import starling.display.Image;


	public class LoadingScreen extends Sprite {

		var loadingBar: Image;
		var main:Main;

		var loadingBar:Image;
		var menuBackground:Image;
		
		public function LoadingScreen() {
			// constructor code

			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		//When finished loading does this!
		public function onLoadingProcess(ratio: Number): void {
			if (ratio === 1) {
				Navigator.instance.loadScreen("mainMenu");
			}
		}

		private function onAddedToStage(event: Event) {
			trace("LoadingScreen loaded");
//			Starling.juggler.delayCall(conditionMet, 2.0);
			addLoadingBar();
			addMenuBackground();
		}
		
		
		function addMenuBackground(){
			menuBackground = new Image(Navigator.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		
//		private function conditionMet() {
//			trace("Loading complete, loading Main Menu");
//			Navigator.instance.loadScreen("mainMenu");
//		}

		private function addLoadingBar() {
			loadingBar = new Image(main.assets.getTexture("LoadingBar"));
			addChild(loadingBar);

			loadingBar.x = (Starling.current.stage.stageWidth - loadingBar.width) / 2;
			loadingBar.y = (Starling.current.stage.stageHeight - loadingBar.height) / 2;
		}
	}
}