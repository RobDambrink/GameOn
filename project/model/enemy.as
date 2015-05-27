package model
{
	import starling.core.Starling;
	import starling.events.Event;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import view.*;
	
	
	public class Enemy extends Sprite
	{ 
		
		
		private var speed:int;
		public var enemy:Image;
		
		public function Enemy(){
			trace("constructor aangeroepen");
			speed=1;
			enemy = new Image(Main.assets.getTexture("Green24"));
			addChild(enemy);
		}
		

	}
 
}