package view  {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	public class MainMenuScreen extends Sprite{
		
		var playBtn:Image;
		var pharmacyButton:Image;
		var tutorialButton:Image;
		var optionsButton:Image;
		
		
		public function MainMenuScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		
		
		
		
		private function onAddedToStage(event:Event)
		{
			trace("MainMenuScreen loaded");
			addPlayBtn();
			addPharmacyButton();
			addTutorialButton();
			addOptionsButton();
		}
		
		
		
		//--------------------start of adding buttons----------------
		
		private function addPlayBtn(){
			var texture:Texture = Texture.fromBitmapData( new PlayButton() );
			playBtn = new Image( texture );
			addChild( playBtn );
			
			playBtn.y = 0;
			
			playBtn.addEventListener( TouchEvent.TOUCH , onPlayButton );
		}
		
		private function addPharmacyButton(){
			var texture:Texture = Texture.fromBitmapData( new PharmacyButton() );
			pharmacyButton = new Image( texture );
			addChild( pharmacyButton );
			
			pharmacyButton.y = 100;
			
			pharmacyButton.addEventListener( TouchEvent.TOUCH , onPharmacyButton );
		}
		
		private function addTutorialButton(){
			var texture:Texture = Texture.fromBitmapData( new TutorialButton() );
			tutorialButton = new Image( texture );
			addChild( tutorialButton );
			
			tutorialButton.y = 200;
			
			tutorialButton.addEventListener( TouchEvent.TOUCH , onTutorialButton );
		}
		
		private function addOptionsButton(){
			var texture:Texture = Texture.fromBitmapData( new OptionsButton() );
			optionsButton = new Image( texture );
			addChild( optionsButton );
			
			optionsButton.y = 300
			
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
