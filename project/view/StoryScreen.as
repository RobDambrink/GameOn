package view {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import flash.utils.setTimeout;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.core.Starling;
	
	public class StoryScreen extends Sprite{
		
		private var level:int;
		private var comicCount:int=0;
		private var tapImage:Image;
		private var firstFrame:Image;
		private var secondFrame:Image;
		private var thirdFrame:Image;
		private var fourthFrame:Image;
		private var fifthFrame:Image;
		private var sixthFrame:Image;
		private var seventhFrame:Image;

		public function StoryScreen(level:int) {
			// constructor code
			this.level=level;
			//Only when added to the stage, the function onAddedToStage will be executed.
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event){
			tapImage = new Image(Main.assets.getTexture("Comic0"));
			addChild(tapImage);
			tapImage.addEventListener( TouchEvent.TOUCH , onTap );
			if(level===1){
				firstFrame = new Image(Main.assets.getTexture("Comic1.1"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.2"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.3"));
			}
			if(level===2){
				firstFrame = new Image(Main.assets.getTexture("Comic1.4"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.1"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.2"));
			}
			if(level===3){
				firstFrame = new Image(Main.assets.getTexture("Comic1.3"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.4"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.1"));
				fourthFrame = new Image(Main.assets.getTexture("Comic1.2"));
				fifthFrame = new Image(Main.assets.getTexture("Comic1.3"));
				sixthFrame = new Image(Main.assets.getTexture("Comic1.4"));
				seventhFrame = new Image(Main.assets.getTexture("Comic1.1"));
			}
			if(level===4){
				firstFrame = new Image(Main.assets.getTexture("Comic1.2"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.3"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.4"));
				fourthFrame = new Image(Main.assets.getTexture("Comic1.1"));
			}
			if(level===5){
				firstFrame = new Image(Main.assets.getTexture("Comic1.2"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.3"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.4"));
				fourthFrame = new Image(Main.assets.getTexture("Comic1.1"));
			}
			if(level===6){
				firstFrame = new Image(Main.assets.getTexture("Comic1.2"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.3"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.4"));
			}
			if(level===7){
				firstFrame = new Image(Main.assets.getTexture("Comic1.1"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.2"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.3"));
				fourthFrame = new Image(Main.assets.getTexture("Comic1.4"));
				fifthFrame = new Image(Main.assets.getTexture("Comic1.1"));
			}
			if(level===8){
				firstFrame = new Image(Main.assets.getTexture("Comic1.2"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.3"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.4"));
				fourthFrame = new Image(Main.assets.getTexture("Comic1.1"));
			}
			if(level===9){
				firstFrame = new Image(Main.assets.getTexture("Comic1.2"));
				secondFrame = new Image(Main.assets.getTexture("Comic1.3"));
				thirdFrame = new Image(Main.assets.getTexture("Comic1.4"));
				fourthFrame = new Image(Main.assets.getTexture("Comic1.1"));
			}
		}

		private function onTap(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN){
					if(comicCount==0){
						removeChild(tapImage);
						addChild(firstFrame);
						firstFrame.addEventListener(TouchEvent.TOUCH, onTap);
						comicCount=1;
						firstFrame.x=(Starling.current.stage.stageWidth-firstFrame.width)/2;
					}
					else if(comicCount==1){
						addChild(secondFrame);
						secondFrame.addEventListener( TouchEvent.TOUCH , onTap );
						comicCount=2;
					}	
					else if(comicCount==2){
						addChild(thirdFrame);
						thirdFrame.addEventListener( TouchEvent.TOUCH , onTap );
						comicCount=3;						
					}
					else if(comicCount==3 && fourthFrame!=null){
						addChild(fourthFrame);
						fourthFrame.addEventListener( TouchEvent.TOUCH , onTap );
						comicCount=4;						
					}
					else if(comicCount==4 && fifthFrame!=null){
						addChild(fifthFrame);
						fifthFrame.addEventListener( TouchEvent.TOUCH , onTap );
						comicCount=5;						
					}
					else if(comicCount==5 && sixthFrame!=null){
						addChild(sixthFrame);
						sixthFrame.addEventListener(TouchEvent.TOUCH, onTap);
						comicCount=6;
					}
					else if(comicCount==6 && seventhFrame!=null){
						addChild(seventhFrame);
						seventhFrame.addEventListener(TouchEvent.TOUCH, onTap);
						comicCount=7;
					}
					else{
						startLevel();
					}
			}
		}
				
				
				
		public function startLevel(){
			trace("loading level", level);
			Navigator.instance.loadScreen("game",level);
		}
	}	
}
