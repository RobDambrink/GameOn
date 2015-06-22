package  model{
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.EnterFrameEvent;
	import starling.display.MovieClip;
	import flash.utils.setTimeout;
	

/**
	Walls are the obstacles that form the maze through which the player and enemies move. 
*/
	public class Wall extends Sprite{
	
	var wall:Image;
	var exitAnimation:MovieClip;
	public var animHeight:int = 24*Main.scaleFactor;
	public var animWidth:int = 24*Main.scaleFactor;
	var wallType:String;
		
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
				//wall = new Image(Main.assets.getTexture("TileExit"));
				wallType=type;
				
				exitAnimation = new MovieClip(Main.assets.getTextures("boy-front0000"),24); // first frame from spritesheet
				addChild(exitAnimation);
				Starling.juggler.add(exitAnimation);
				exitAnimation.height=animHeight;
				exitAnimation.width=animWidth;
				exitAnimation.loop=false;
				exitAnimation.play();
			}
			if(wall){
				addChild( wall );
			}
			addEventListener(Event.ENTER_FRAME, updateAnimation);
		}
		
		function updateAnimation(event:Event){
			//var maxHealthReached:Boolean;
			if(wallType=="Exit"){
				if(HealthBar.hp>(HealthBar.maxHp-1)){
					//maxHealthReached = true;
					Navigator.soundManager.playSound("bell", 1.0, 1);
					exitAnimation = new MovieClip(Main.assets.getTextures("boy-infected0000"),24); // spritesheet of exit opening
					addChild(exitAnimation);
					Starling.juggler.add(exitAnimation);
					exitAnimation.height=animHeight;
					exitAnimation.width=animWidth;
					exitAnimation.loop=false;
					exitAnimation.play();	
					setTimeout(function(){Navigator.soundManager.stopSound("bell");},2000);
				}
				if(HealthBar.hp<=(HealthBar.maxHp-1)){
					maxHealthReached = false;
				}
			}
		}
		
	}
}
