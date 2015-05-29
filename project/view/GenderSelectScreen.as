package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	
	public class GenderSelectScreen extends Sprite{

		var maleButton:Image;
		var femaleButton:Image;
		var maleImage:Image;
		var femaleImage:Image;
		var menuBackground:Image;

		public function GenderSelectScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("GenderSelectScreen loaded");
			
			addMenuBackground();
			addMale();
			addFemale();
			addMaleButton();
			addFemaleButton();
		}
		
		function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		//--------------------start of adding buttons----------------

		private function addMale(){
			maleImage = new Image(Main.assets.getTexture("BoyFront")); 
			addChild( maleImage );
			
			maleImage.y = 0;
			
			maleImage.addEventListener( TouchEvent.TOUCH , onMaleButton );
		}
		
		private function addFemale(){
			femaleImage = new Image(Main.assets.getTexture("GirlFront")); 
			addChild( femaleImage );
			
			femaleImage.y = 0;
			
			femaleImage.addEventListener( TouchEvent.TOUCH , onFemaleButton );
		}
		
		private function addMaleButton(){
			maleButton = new Image(Main.assets.getTexture("MaleButton")); 
			addChild( maleButton );
			
			maleButton.y = 0;
			
			maleButton.addEventListener( TouchEvent.TOUCH , onMaleButton );
		}
		
		private function addFemaleButton(){
			femaleButton = new Image(Main.assets.getTexture("FemaleButton"));
			addChild( femaleButton );
			
			femaleButton.y = 100;
			
			femaleButton.addEventListener( TouchEvent.TOUCH , onFemaleButton );
		}
		//---------------end of adding buttons------------------

		
		//---------------start of button's event handlers-------
		
		private function onMaleButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
//the variable GENDER gets set to Male
				Navigator.instance.loadScreen( "tutorial" );
			}
		}
		
		private function onFemaleButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
//the variable GENDER gets set to Female
				Navigator.instance.loadScreen( "tutorial" );
			}
		}
		//---------------end of button's event handlers---------
		
	}
	
}
