package {

	import flash.display.MovieClip;
	import starling.core.Starling;
<<<<<<< HEAD
	import view.Navigator;
	Import starling.core.Starling;

	public class Main extends MovieClip {



=======
	
	
	public class Main extends MovieClip {
		
	//public static var assets:AssetManager = new AssetManager();	
		
>>>>>>> 052a7c9e71a9e66325d6045d6c4f32ee5ea45aea
		public function Main() {

			var _mStarling: Starling = new Starling(Navigator, stage); //These 2 lines are mandatory for Starling to work
			_mStarling.start();

<<<<<<< HEAD
=======
			
>>>>>>> 052a7c9e71a9e66325d6045d6c4f32ee5ea45aea
			_mStarling.showStats = false; //Shows framerate and other stats when true

			// constructor code
		}
		
		
	}

}
