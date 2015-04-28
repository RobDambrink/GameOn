package  {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class MenuScreen extends Sprite{
		
		
		var button:Image;
		var menu:String;
		
		
		public function MenuScreen(menu:String) {
			// constructor code
			this.menu=menu;
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event){
			trace(menu + " screen loaded");
			addButton();
		}
		
		
		
		
		private function addButton(y:int){
			var texture:Texture = Texture.fromBitmapData( new menu+Button() );
			button = new Image( texture );
			addChild( button );
			
			button.y = y;
			
			button.addEventListener( TouchEvent.TOUCH , onButton );
		}
		
		private function onButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( menu );
			}
		}
		
		
	}
	
}
