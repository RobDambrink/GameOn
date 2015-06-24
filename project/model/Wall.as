package  model{
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.EnterFrameEvent;
	import starling.display.MovieClip;
	import flash.utils.setTimeout;
	import view.*;
	

/**
	Walls are the obstacles that form the maze through which the player and enemies move. 
*/
	public class Wall extends Sprite{
	
	public var wall:Image;
	public var exitAnimation:MovieClip;
	public var animHeight:int = 24;
	public var animWidth:int = 24;
	public var wallType:String;
		
		public function Wall(type:String) {
			if (type === "House"){
				wall = new Image(Main.assets.getTexture("TileHouse"));
			}
			if (type === "Tree"){
				wall = new Image(Main.assets.getTexture("TileTree"));
			}
			if (type === "Table"){
				wall = new Image(Main.assets.getTexture("TileTable"));
			}
			if (type === "Transparent"){
				wall = new Image(Main.assets.getTexture("TileTransparent"));
			}
			if (type === "Exit"){
				wallType=type;
				exitAnimation = new MovieClip(Main.assets.getTextures("open-door0000"),24); // first frame from Exit spritesheet
				addChild(exitAnimation);
				Starling.juggler.add(exitAnimation);
				exitAnimation.height=animHeight;
				exitAnimation.width=animWidth;
				exitAnimation.loop=false;
				exitAnimation.play();
				addEventListener(Event.ENTER_FRAME, updateAnimation);
			}
			if(wall){
				addChild( wall );
			}
			MainMenuScreen.saveDataObject.data.fullHealthSound = false;
		}
		
		
		function updateAnimation(event:Event){
			if(wallType=="Exit"){
				if(HealthBar.hp>(HealthBar.maxHp-1)){
					if(MainMenuScreen.saveDataObject.data.fullHealthSound == false){
						Navigator.soundManager.playSound("bell", 1.0, 1);
						if(exitAnimation.isComplete){
							exitAnimation.stop();
							removeChild(exitAnimation);
							Starling.juggler.remove(exitAnimation);
					
							exitAnimation = new MovieClip(Main.assets.getTextures("open-door"),24); // spritesheet of exit opening
							addChild(exitAnimation);
							Starling.juggler.add(exitAnimation);
							exitAnimation.height=animHeight;
							exitAnimation.width=animWidth;
							exitAnimation.loop=false;
							exitAnimation.play();
						}	
						MainMenuScreen.saveDataObject.data.fullHealthSound = true;
					}
				}
			}
		}
		
		
	}
}
