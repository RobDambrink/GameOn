package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	public class PharmacyScreen extends Sprite{
		
		var menuBackground:Image;
		var backButton:Image;
		var buyButton:Image;
		private var condomText:TextField;
		private var starsText:TextField;
		
		public function PharmacyScreen() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		private function onAddedToStage(event:Event){
			trace("PharmacyScreen loaded");
			addMenuBackground();
			addBackButton();
			addBuyButton();
			
			condomText = new TextField(200,100,"Condoms: " + GameScreen.condomCount.toString());
			condomText.x = 200;
			condomText.y = 100;
			addChild(condomText);
			
//			starsText = new TextField(200,100,"Stars: " + GameScreen.condomCount.toString());
//			starsText.x = 200;
//			starsText.y = 150;
//			addChild(starsText);
		}
		
		
		private function addBuyButton(){
			buyButton = new Image(Main.assets.getTexture("Circle"));
			addChild(buyButton);
			buyButton.y = 100;
			buyButton.x = 100;
			buyButton.addEventListener(TouchEvent.TOUCH, buyCondom);
		}
		
		
		private function buyCondom(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				GameScreen.condomCount++;
				//ScoreScreen.currency--;
				
				condomText.text = "Condoms: " + GameScreen.condomCount.toString();
//				starsText.text = "Stars: " + ScoreScreen.currency.toString();
			}
		}
		
		
		private function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("MainMenuBackground"));
			addChild( menuBackground );
		}
		
		
		private function addBackButton(){
			backButton = new Image(Main.assets.getTexture("BackButton"));
			addChild(backButton);
			backButton.y = 15;
			backButton.x = 15;
			backButton.addEventListener(TouchEvent.TOUCH, onBackButton);
		}
		
		
		private function onBackButton(event: TouchEvent){
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				Navigator.breadcrumbs.pop();
				Navigator.breadcrumbs[0] = "mainMenu";
				Navigator.instance.loadScreen(Navigator.breadcrumbs[Navigator.breadcrumbs.length - 1],0);
			}
		}
	}
}