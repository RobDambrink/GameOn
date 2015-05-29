﻿package model {
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;	
	import view.*;


	public class HealthBar extends Sprite{
		
		//var main:Main;
		var gameScreen:GameScreen;
		var healthFill:Image;
		
		public static var hp:int = 80;
		public static var maxHp:int = 100;
		var percentHp:Number = hp/maxHp;
		

		
		
		public function HealthBar(screen:GameScreen) {
			// constructor code
			var healthStroke:Image = new Image(Main.assets.getTexture("HealthBarEmpty"));
			addChild( healthStroke );
			
			healthFill = new Image(Main.assets.getTexture("HealthBarFull"));
			addChild( healthFill );
			healthFill.x = healthStroke.x;
			healthFill.y = healthStroke.y;
		}
		
		
		public function updateHealthBar(){
			percentHp = hp / maxHp;
			healthFill.scaleX = (percentHp - 0.01);
			
			if (hp > (maxHp - 1)){
				hp = maxHp;
				trace("u win m8");
			}
			
			if (hp < 1){
				hp = 0;
				trace("u ded m8");
			}
		}
		
		
		
	}
	
}
