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
		public static var muted:Boolean=false;
		public static var saveDataObject:SharedObject = SharedObject.getLocal("savedata");
		
		/**
		*	Constructor
		**/
		public function MainMenuScreen(){
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		/**
		*	Calls all functions that add buttons to the screen, sets standard values for the savedata and delaycalls menuSoundstart which starts the music.
		*	@param event - The onAddedToStage event.
		**/
		private function onAddedToStage(event: Event) {			
			var myDataObject:Object = {gender:"", condomCount:0, currency:0, fullHealthSound:false};
			
			addMenuBackground();
			addPlayBtn();
			addPharmacyButton();
			addTutorialButton();
			if(muted){
				addUnMuteButton()
			}
			else if(!muted){
				addMuteButton();
			}
			
			Starling.juggler.delayCall(menuSoundStart, 0.1);
		}
		
		/**
		*	Starts playing the background music if it is not already playing.
		**/
		function menuSoundStart(){
			if(!Navigator.soundManager.soundIsPlaying("menuSound")){
				Navigator.soundManager.playSound("menuSound", 1.0, 999);
			}
		}

		/**
		*	Adds the background image.
		**/
		function addMenuBackground() {
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild(menuBackground);

		}


		//--------------------start of adding buttons----------------
		/**
		*	All functions below add the different buttons to the stage.
		**/

		private function addPlayBtn() {
			playBtn = new Image(Main.assets.getTexture("ButtonPlay"));
			addChild(playBtn);

			playBtn.y = 15;
			playBtn.x = (Starling.current.stage.stageWidth - playBtn.width) / 2;

			playBtn.addEventListener(TouchEvent.TOUCH, onPlayButton);
		}

		private function addPharmacyButton() {
			pharmacyButton = new Image(Main.assets.getTexture("ButtonPharmacy"));
			addChild(pharmacyButton);

			pharmacyButton.y = playBtn.y + playBtn.height + 10;
			pharmacyButton.x = (Starling.current.stage.stageWidth - pharmacyButton.width) / 2;

			pharmacyButton.addEventListener(TouchEvent.TOUCH, onPharmacyButton);
		}

		private function addTutorialButton() {
			tutorialButton = new Image(Main.assets.getTexture("ButtonTutorial"));
			addChild(tutorialButton);

			tutorialButton.y = pharmacyButton.y + pharmacyButton.height + 10;
			tutorialButton.x = (Starling.current.stage.stageWidth - tutorialButton.width) / 2;

			tutorialButton.addEventListener(TouchEvent.TOUCH, onTutorialButton);
		}
		
		private function addMuteButton(){
			muteButton = new Image(Main.assets.getTexture("ButtonMute"));
			addChild(muteButton);
			muteButton.y=(Starling.current.stage.stageHeight-muteButton.height)*(31/32);
			muteButton.x=(Starling.current.stage.stageWidth-muteButton.width)*(31/32);
			muteButton.addEventListener(TouchEvent.TOUCH, onMuteButton);
		}
		
		private function addUnMuteButton(){
			muteButton = new Image(Main.assets.getTexture("ButtonUnmute"));
			addChild(muteButton);
			muteButton.y=(Starling.current.stage.stageHeight-muteButton.height)*(31/32);
			muteButton.x=(Starling.current.stage.stageWidth-muteButton.width)*(31/32);
			muteButton.addEventListener(TouchEvent.TOUCH, onMuteButton);
		}

		//---------------end of adding buttons------------------

		//---------------start of button's event handlers-------
		//All event parameters are touch events that trigger when the button is pressed.
		
		/**
		*	If sound is not muted, all sound is muted. If sound is already muted, all sound is unmuted.
		**/
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
					removeChild(muteButton);
					addMuteButton();
					Navigator.soundManager.muteAll(false);
					muted=false;
				}
			}
		}
		
		/**
		*	Loads the playMenu page.
		**/
		private function onPlayButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.instance.loadScreen("playMenu",0);
			}
		}

		/**
		*	Loads the pharmacy page.
		**/		
		private function onPharmacyButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.instance.loadScreen("pharmacy",0);
			}
		}

		/**
		*	Starts the addTutorial method which shows the tutorial.
		**/
		private function onTutorialButton(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				addTutorial(tutCount);
			}
		}
		
		/**
		*	Loads the tutorial, next button and previous button images;
		*	@param count - Count tells addTutorial which tutorial screen it should load.
		**/
		private function addTutorial(count:int){
			if(count==1){
				tutorial = new Image(Main.assets.getTexture("tutorial-screen-1"));
			}
			if(count==2){
				tutorial = new Image(Main.assets.getTexture("tutorial-screen-2"));			
			}
			if(count==3){
				tutorial = new Image(Main.assets.getTexture("tutorial-screen-3"));			
			}
			tutContinue = new Image(Main.assets.getTexture("ButtonTutorialContinue")); 
			tutReturn = new Image(Main.assets.getTexture("ButtonTutorialReturn")); 
			
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
		
		/**
		*	Removes the tutorial, next button and previous button images.
		**/
		private function removeTutorial(){
			removeChild(tutorial);
			removeChild(tutContinue);
			removeChild(tutReturn);
		}
		
		/**
		*	Removes the current tutorial, next button and previous button images and replaces them with those images for the previous tutorial.
		*	Just removes all tutorial images if the first tutorial page is showing.
		**/
		public function onTutReturn(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN){
				if(tutCount==1){
					removeTutorial();
				}
				if(tutCount==2){
					tutCount=1;
					removeTutorial();
					addTutorial(tutCount);				
				}
				if(tutCount==3){
					tutCount=2;
					removeTutorial();
					addTutorial(tutCount);
				}
			}
		}
		
		/**
		*	Removes the current tutorial, next button and previous button images and replaces them with those images for the next tutorial.
		*	Just removes all tutorial images if the third tutorial page is showing.
		**/
		public function onTutContinue(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN){
				if(tutCount==1){
					tutCount=2;
					removeTutorial();
					addTutorial(tutCount);
				}
				else if(tutCount==2){
					tutCount=3;
					removeTutorial();
					addTutorial(tutCount);				
				}
				else if(tutCount==3){
					tutCount=1;
					removeTutorial();
				}

			}
		}

		
		//---------------end of button's event handlers---------



	}

}