package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.core.Starling;
	import model.*;
	
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
			menuBackground = new Image(Main.assets.getTexture("background-orange"));
			addChild( menuBackground );
		}
		
		//--------------------start of adding buttons----------------

		private function addMale(){
			maleImage = new Image(Main.assets.getTexture("BoyFrontImage")); 
			addChild( maleImage );
			
			maleImage.x = (Starling.current.stage.stageWidth - maleImage.width) * (1/4);
			maleImage.y = (Starling.current.stage.stageHeight - maleImage.height) * (1/4);
			
			maleImage.addEventListener( TouchEvent.TOUCH , onMaleButton );
		}
		
		private function addFemale(){
			femaleImage = new Image(Main.assets.getTexture("GirlFrontImage")); 
			addChild( femaleImage );
			
			femaleImage.x = (Starling.current.stage.stageWidth - femaleImage.width) * (3/4);
			femaleImage.y = (Starling.current.stage.stageHeight - femaleImage.height) * (1/4);
			
			femaleImage.addEventListener( TouchEvent.TOUCH , onFemaleButton );
		}
		
		private function addMaleButton(){
			maleButton = new Image(Main.assets.getTexture("MaleButton")); 
			addChild( maleButton );
			
			maleButton.x = (Starling.current.stage.stageWidth - maleButton.width) * (1/6);
			maleButton.y = (Starling.current.stage.stageHeight - maleButton.height) * (3/4);
			
			maleButton.addEventListener( TouchEvent.TOUCH , onMaleButton );
		}
		
		private function addFemaleButton(){
			femaleButton = new Image(Main.assets.getTexture("FemaleButton"));
			addChild( femaleButton );
			
			femaleButton.x = (Starling.current.stage.stageWidth - femaleButton.width) * (5/6);
			femaleButton.y = (Starling.current.stage.stageHeight - femaleButton.height) * (3/4);
			
			femaleButton.addEventListener( TouchEvent.TOUCH , onFemaleButton );
		}
		//---------------end of adding buttons------------------

		
		//---------------start of button's event handlers-------
		
		private function onMaleButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
//the variable GENDER gets set to Male
				MainMenuScreen.saveDataObject.data.gender = "male";
				Navigator.instance.loadScreen( "tutorial" ,0);
			}
		}
		
		private function onFemaleButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
//the variable GENDER gets set to Female
				MainMenuScreen.saveDataObject.data.gender = "female";
				Navigator.instance.loadScreen( "tutorial" ,0);
			}
		}
		//---------------end of button's event handlers---------
		
	}
	
}
