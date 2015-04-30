package {
	
	import starling.display.Sprite;
	import starling.core.Starling;
	import starling.utils.AssetManager;
	import flash.desktop.NativeApplication;
	import flash.filesystem.File;
	import flash.system.Capabilities;
	import view.LoadingScreen;
	
	public class Navigator extends Sprite {

		//Makes the variable usable by other classes.
		public static var instance:Navigator;
		public static var assets:AssetManager = new AssetManager();
		
		//Variable needed to load instances of other classes.
		var nextScreen:Sprite;
		
		
		//constructor code
		public function Navigator(){
			Navigator.instance = this;
			assets.verbose = true;
			var appDir:File = File.applicationDirectory;
			assets.enqueue (appDir.resolvePath("assets"));
			assets.loadQueue(function(ratio:Number):void
				{
					trace("Loading assets, progress:", ratio);
 
					// -> When the ratio equals '1', we are finished.
					if (ratio == 1.0)
						loadScreen ("loadingScreen");	
				}
			);
			
		}
			
		/**public static function instance():Navigator{
			if (!instance){
				instance = this;
			}
			return instance;
			
		}*/
		
		//Switch screen function. Code to load a new screen and remove the previous screen from the stage. Loads mainMenu by default.
		public function loadScreen( screenName:String ) 	// screenName:String = "mainMenu"
		{
			if( nextScreen != null && contains( nextScreen ) )
			{
				removeChild( nextScreen, true );
			}			
			
			if( screenName == "loadingScreen"){
				nextScreen = new LoadingScreen();
			}
			
			/**else if ( screenName == "mainMenu" ){
				nextScreen = new MainMenuScreen();
			}
			
			else if ( screenName == "playMenu" ){
				nextScreen = new PlayMenuScreen();
			}
			
			else if ( screenName == "genderSelect" ){
				nextScreen = new GenderSelectScreen();
			}
			
			else if ( screenName == "tutorial" ){
				nextScreen = new TutorialScreen();
			}
			
			else if ( screenName == "pharmacy" ){
				nextScreen = new PharmacyScreen();
			}
			
			else if ( screenName == "optionsMenu" ){
				nextScreen = new OptionsMenuScreen();
			}
			
			else if ( screenName == "levelSelect" ){
				nextScreen = new LevelSelectScreen();
			}
			
			else if ( screenName == "story" ){
				nextScreen = new StoryScreen();
			}
			
			else if ( screenName == "lostGame" ){
				nextScreen = new LostGameScreen();
			}
			
			else if ( screenName == "scoreScreen" ){
				nextScreen = new ScoreScreen();
			}
			
			else if ( screenName == "game" ){
				nextScreen = new GameScreen();
			}*/
			addChild( nextScreen );
		}
	}
	
}
