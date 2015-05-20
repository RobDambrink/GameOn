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
			//Select the male sprite
			if (gender == "male") {
				player = new Image(Main.assets.getTexture("Circle"));
			}
			//select the female sprite
			if (gender == "female") {
				player = new Image(Main.assets.getTexture("Circle"));
			}
			addChild(player);
		}

		/**
			Returns the gender chosen in the genderselect screen.
		*/
		public function getGender() {
			return gender;
		}
		
		private function update(dir:String){
			
		}
		
		public function pickupDot() {}

		public function touchEnemy() {}
		
		/**
			Enter a negative value to decrease the speed and a positive value to increase the speed.
		*/
		public function changeSpeed(change: int) {
			this.speed += change;
		}

		public function hitWall(){
			
		}
		
		/**
			This method is called when a player has completed a level and touches the exit.
		*/
		public function exitLevel() {}


	}
}
