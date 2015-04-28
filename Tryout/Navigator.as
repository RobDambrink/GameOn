package  {
	import starling.display.Sprite;
	
	public class Navigator extends Sprite {

		//Makes the variable usable by other classes.
		public static var instance:Navigator;
		
		//Variable needed to load instances of other classes.
		var nextScreen:Sprite;
		
		
		//constructor code
		public function Navigator() 
		{
			Navigator.instance = this;
			loadScreen( "loadingScreen")
		}
		
		
		
		//Switch screen function. Code to load a new screen and remove the previous screen from the stage. Loads mainMenu by default.
		public function loadScreen( screenName:String ) 	// screenName:String = "mainMenu"
		{
			if( nextScreen != null && contains( nextScreen ) )
			{
				removeChild( nextScreen, true );
			}
			
			
			if( screenName == "loadingScreen")
			{
				nextScreen = new LoadingScreen();
			}
			
			else if ( screenName == "mainMenu" )
			{
				nextScreen = new MainMenuScreen();
			}
			
			else if ( screenName == "playMenu" )
			{
				nextScreen = new PlayMenuScreen();
			}
			
			else if ( screenName == "genderSelect" )
			{
				nextScreen = new GenderSelectScreen();
			}
			
			else if ( screenName == "tutorial" )
			{
				nextScreen = new TutorialScreen();
			}
			
			else if ( screenName == "pharmacy" )
			{
				nextScreen = new PharmacyScreen();
			}
			
			else if ( screenName == "optionsMenu" )
			{
				nextScreen = new OptionsMenuScreen();
			}
			
			else if ( screenName == "levelSelect" )
			{
				nextScreen = new LevelSelectScreen();
			}
			
			else if ( screenName == "story" )
			{
				nextScreen = new StoryScreen();
			}
			
			else if ( screenName == "lostGame" )
			{
				nextScreen = new LostGameScreen();
			}
			
			else if ( screenName == "scoreScreen" )
			{
				nextScreen = new ScoreScreen();
			}
			
			else if ( screenName == "game" )
			{
				nextScreen = new GameScreen();
			}


			addChild( nextScreen );
		}
	}
	
}
