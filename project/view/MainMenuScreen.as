package view  {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.core.Starling;
	import starling.utils.formatString;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import flash.desktop.NativeApplication;
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.geom.Rectangle;
    import flash.system.Capabilities;
    import flash.utils.ByteArray;
    import flash.utils.setTimeout;

    import starling.core.Starling;
    import starling.events.Event;
    import starling.textures.RenderTexture;
    import starling.utils.AssetManager;
    import starling.utils.RectangleUtil;
    import starling.utils.ScaleMode;
    import starling.utils.SystemUtil;
    import starling.utils.formatString;
	
	public class MainMenuScreen extends Sprite{
		

		var menuBackground:Image;
		var playBtn:Image;
		var pharmacyButton:Image;
		var tutorialButton:Image;
		var optionsButton:Image;
		
		//var main:Main;
		
		private var mStarling:Starling;

		
		
		public function MainMenuScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		
		
		
		
		private function onAddedToStage(event:Event)
		{
			trace("MainMenuScreen loaded");
			addMenuBackground();
			addPlayBtn();
			addPharmacyButton();
			addTutorialButton();
			addOptionsButton();
		}
		
		
		function addMenuBackground(){
			trace("background loaded");
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild(menuBackground);

		}
		
		
		//--------------------start of adding buttons----------------
		
		private function addPlayBtn(){
			playBtn = new Image(Main.assets.getTexture("PlayButton"));
			addChild( playBtn );
			
			playBtn.y = 30;
			playBtn.x = (Starling.current.stage.stageWidth - playBtn.width) / 2;
			
			playBtn.addEventListener( TouchEvent.TOUCH , onPlayButton );
		}
		
		private function addPharmacyButton(){
			pharmacyButton = new Image(Main.assets.getTexture("PharmacyButton"));
			addChild( pharmacyButton );
			
			pharmacyButton.y = playBtn.y + playBtn.height + 20;
			pharmacyButton.x = (Starling.current.stage.stageWidth - pharmacyButton.width) / 2;
			
			pharmacyButton.addEventListener( TouchEvent.TOUCH , onPharmacyButton );
		}
		
		private function addTutorialButton(){
			tutorialButton = new Image(Main.assets.getTexture("TutorialButton"));
			addChild( tutorialButton );
			
			tutorialButton.y = pharmacyButton.y + pharmacyButton.height + 20;
			tutorialButton.x = (Starling.current.stage.stageWidth - tutorialButton.width) / 2;
			
			tutorialButton.addEventListener( TouchEvent.TOUCH , onTutorialButton );
		}
		
		private function addOptionsButton(){
			optionsButton = new Image(Main.assets.getTexture("OptionsButton"));
			addChild( optionsButton );
			
			optionsButton.y = tutorialButton.y + tutorialButton.height + 20;
			optionsButton.x = (Starling.current.stage.stageWidth - optionsButton.width) / 2;
			
			optionsButton.addEventListener( TouchEvent.TOUCH , onOptionsButton );
		}
		//---------------end of adding buttons------------------
		
		
		
		//---------------start of button's event handlers-------
		
		private function onPlayButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "playMenu" );
			}
		}
		
		private function onPharmacyButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "pharmacy" );
			}
		}
		
		private function onTutorialButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "tutorial" );
			}
		}
		
		private function onOptionsButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "optionsMenu" );
			}
		}
		//---------------end of button's event handlers---------
	
		
		
	}
	
}
