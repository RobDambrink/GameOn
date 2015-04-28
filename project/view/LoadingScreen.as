package  view{
	import starling.events.Event;
	import starling.display.Sprite;
	import starling.core.Starling;
	import starling.textures.Texture;
	import starling.display.Image;
	
	
	public class LoadingScreen extends Sprite{

		var loadingBar:Image;



		public function LoadingScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		private function onAddedToStage(event:Event)
		{
			trace("LoadingScreen loaded");
			Starling.juggler.delayCall(conditionMet, 2.0);
			
			addLoadingBar();
		}
		
		private function conditionMet()
		{
			trace("Loading complete, loading Main Menu");
			Navigator.instance.loadScreen( "mainMenu" );
		}
		
		private function addLoadingBar(){
			var texture:Texture = Texture.fromBitmapData( new LoadingBar() );
			loadingBar = new Image( texture );
			addChild( loadingBar );
			
			loadingBar.x = (Starling.current.stage.stageWidth - loadingBar.width) / 2;
			loadingBar.y = (Starling.current.stage.stageHeight - loadingBar.height) / 2;
		}
		
	}
	
}
