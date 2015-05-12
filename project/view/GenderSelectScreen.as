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
<<<<<<< HEAD
		//var main:Main;

=======
		var menuBackground:Image;
>>>>>>> ba00e991d302bfaa0cfdaa1fc8705fc36d7c58e5

		public function GenderSelectScreen() {
			// constructor code
			
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("GenderSelectScreen loaded");
			
			addMenuBackground();
			addMaleButton();
			addFemaleButton();
		}
		
		function addMenuBackground(){
			menuBackground = new Image(Navigator.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		//--------------------start of adding buttons----------------

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
