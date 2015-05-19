package model {

	import starling.core.Starling;
	import starling.events.Event;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import view.*;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;


	public class Player extends Sprite {

		public var speed: int = 5;
		public var infected: Boolean;
		public var gender: String = "male";
			

		public function Player(){
			
			var player: Image

			if (gender == "male") {
				player = new Image(Main.assets.getTexture("Circle"));
			}

			if (gender == "female") {
				player = new Image(Main.assets.getTexture("Circle"));
			}
			addChild(player);
		}

		public function getGender() {
			return gender;
		}
		
		private function update(dir:String){
			
		}
		
		public function pickupDot() {}

		public function touchEnemy() {}

		public function changeSpeed(change: int) {
			this.speed += change;
		}

		public function exitLevel() {}


	}
}
