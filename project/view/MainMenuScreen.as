package view {
	import starling.display.Sprite;

	import starling.textures.Texture;
	import starling.textures.RenderTexture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.utils.formatString;	
	import starling.utils.AssetManager;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	import starling.utils.SystemUtil;
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
	import flash.net.SharedObject;
	import model.Player;

	public class MainMenuScreen extends Sprite {

		var menuBackground: Image;
		var playBtn: Image;
		var pharmacyButton: Image;
		var tutorialButton: Image;
		var tutorial: Image;
		var tutContinue: Image;
		var tutReturn: Image;
		var tutCount: int = 1;
		var muteButton: Image;
		var muted:Boolean=false;
		public static var saveDataObject:SharedObject = SharedObject.getLocal("savedata");
		
		
			public function MainMenuScreen(){
				// constructor code

				//Only when added to the stage, the function onAddedToStage will be executed.
				addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}


		private function onAddedToStage(event: Event) {
			trace("MainMenuScreen loaded");
			
			var myDataObject:Object = {gender:"", condomCount:0, currency:0};
			
			addMenuBackground();
			addPlayBtn();
			addPharmacyButton();
			addTutorialButton();
			addMuteButton();
			
			Starling.juggler.delayCall(menuSoundStart, 0.1);
		}
		
		function menuSoundStart(){
			if(!Navigator.soundManager.soundIsPlaying("menuSound")){
				Navigator.soundManager.playSound("menuSound", 1.0, 999);
			}
		}

		function addMenuBackground() {
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild(menuBackground);

		}


		//--------------------start of adding buttons----------------

		private function addPlayBtn() {
			playBtn = new Image(Main.assets.getTexture("PlayButton"));
			addChild(playBtn);

			playBtn.y = 15;
			playBtn.x = (Starling.current.stage.stageWidth - playBtn.width) / 2;

			playBtn.addEventListener(TouchEvent.TOUCH, onPlayButton);
		}

		private function addPharmacyButton() {
			pharmacyButton = new Image(Main.assets.getTexture("PharmacyButton"));
			addChild(pharmacyButton);

			pharmacyButton.y = playBtn.y + playBtn.height + 10;
			pharmacyButton.x = (Starling.current.stage.stageWidth - pharmacyButton.width) / 2;

			pharmacyButton.addEventListener(TouchEvent.TOUCH, onPharmacyButton);
		}

		private function addTutorialButton() {
			tutorialButton = new Image(Main.assets.getTexture("TutorialButton"));
			addChild(tutorialButton);

			tutorialButton.y = pharmacyButton.y + pharmacyButton.height + 10;
			tutorialButton.x = (Starling.current.stage.stageWidth - tutorialButton.width) / 2;

			tutorialButton.addEventListener(TouchEvent.TOUCH, onTutorialButton);
		}
		
		private function addMuteButton(){
			muteButton = new Image(Main.assets.getTexture("unMuted"));
			addChild(muteButton);
			muteButton.y=(Starling.current.stage.stageHeight-muteButton.height)*(31/32);
			muteButton.x=(Starling.current.stage.stageWidth-muteButton.width)*(31/32);
			muteButton.addEventListener(TouchEvent.TOUCH, onMuteButton);
		}
		
		private function addUnMuteButton(){
			muteButton = new Image(Main.assets.getTexture("muted"));
			addChild(muteButton);
			muteButton.y=(Starling.current.stage.stageHeight-muteButton.height)*(31/32);
			muteButton.x=(Starling.current.stage.stageWidth-muteButton.width)*(31/32);
			muteButton.addEventListener(TouchEvent.TOUCH, onMuteButton);
		}

		//---------------end of adding buttons------------------



		//---------------start of button's event handlers-------

		private function onMuteButton(event: TouchEvent){
			var touch:Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN){
				if(!muted){
					removeChild(muteButton);
					addUnMuteButton();
					Navigator.soundManager.muteAll();
					muted=true;
				}
				else{
					trace("unmute");
					removeChild(muteButton);
					addMuteButton();
					Navigator.soundManager.muteAll(false);
					muted=false;
				}
			}
		}
		
		private function onPlayButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.instance.loadScreen("playMenu",0);
			}
		}

		private function onPharmacyButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.instance.loadScreen("pharmacy",0);
			}
		}

		private function onTutorialButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				addTutorial(1);
			}
		}
		
		private function addTutorial(tutCount:int){
			removeChild(tutorial);
			removeChild(tutContinue);
			removeChild(tutReturn);
			if(tutCount==1){
			tutorial = new Image(Main.assets.getTexture("tutorial-screen-1"));
			}
			if(tutCount==2){
				tutorial = new Image(Main.assets.getTexture("tutorial-screen-2"));			
			}
			if(tutCount==3){
				tutorial = new Image(Main.assets.getTexture("tutorial-screen-3"));			
			}
			tutContinue = new Image(Main.assets.getTexture("TutorialContinueButton")); 
			tutReturn = new Image(Main.assets.getTexture("TutorialReturnButton")); 
			
			addChild(tutorial);
			addChild(tutContinue);
			addChild(tutReturn);
				
			tutContinue.x = (Starling.current.stage.stageWidth - tutContinue.width) * (19/20);
			tutContinue.y = (Starling.current.stage.stageHeight - tutContinue.height) * (1/1);
			tutContinue.addEventListener( TouchEvent.TOUCH , onTutContinue );				
				
			tutReturn.x = (Starling.current.stage.stageWidth - tutReturn.width) * (1/20);
			tutReturn.y = (Starling.current.stage.stageHeight - tutReturn.height) * (1/1);
			tutReturn.addEventListener( TouchEvent.TOUCH , onTutReturn );
		}
		
		private function removeTutorial(){
			removeChild(tutorial);
			removeChild(tutContinue);
			removeChild(tutReturn);
		}
		
		public function onTutReturn(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN){
				if(tutCount==1){
					trace("return tut 1");
					removeTutorial();
				}
				if(tutCount==2){
					trace("return tut 2");
					tutCount=1;
					removeTutorial();
					addTutorial(tutCount);				
				}
				if(tutCount==3){
					trace("return tut 3");
					tutCount=2;
					removeTutorial();
					addTutorial(tutCount);
				}
			}
		}
		
		public function onTutContinue(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN){
				if(tutCount==1){
					trace("continue tut 1");
					tutCount=2;
					removeTutorial();
					addTutorial(tutCount);

				}
				if(tutCount==2){
					trace("continue tut 2");
					tutCount=3;
					removeTutorial();
					addTutorial(tutCount);
				}
				if(tutCount==3){
					trace("continue tut ");
					removeTutorial();	
					tutCount=1;
				}
			}
		}

		
		//---------------end of button's event handlers---------



	}

}