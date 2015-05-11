package {

	import flash.display.MovieClip;
	import starling.display.MovieClip;
	import starling.core.Starling;

	public class Main extends MovieClip {
		
	//public static var assets:AssetManager = new AssetManager();	
		

		public function Main() {

			var _mStarling: Starling = new Starling(Navigator, stage); //These 2 lines are mandatory for Starling to work
			_mStarling.start();
			_mStarling.showStats = false; //Shows framerate and other stats when true

			// constructor code
		}
		
	}

}
