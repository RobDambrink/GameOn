package view{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.core.Starling;
	
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
			addMenuBackground();
			addBackButton();
			addBuyButton();
			
			condomText = new TextField(200,100,"Préservatifs: " + MainMenuScreen.saveDataObject.data.condomCount.toString());
			condomText.x = 200;
			condomText.y = 100;
			addChild(condomText);
			
			starsText = new TextField(200,100,"Étoiles: " + MainMenuScreen.saveDataObject.data.currency.toString());
			starsText.x = 200;
			starsText.y = 150;
			addChild(starsText);
		}
		
		
		private function addBuyButton(){
			buyButton = new Image(Main.assets.getTexture("ButtonCondom"));
			addChild(buyButton);
			buyButton.width=100;
			buyButton.height=100;
			buyButton.y = (Starling.current.stage.stageWidth - buyButton.width) * (1/5);
			buyButton.x = (Starling.current.stage.stageHeight - buyButton.height) * (2/5);
			buyButton.addEventListener(TouchEvent.TOUCH, buyCondom);
			
		}
		
		
		private function buyCondom(event: TouchEvent) {
			var touch: Touch = event.touches[0];
			if (touch.phase == TouchPhase.BEGAN) {
				trace("condomCount: ", MainMenuScreen.saveDataObject.data.condomCount);
				if(MainMenuScreen.saveDataObject.data.currency>=1){
					MainMenuScreen.saveDataObject.data.condomCount++;
					MainMenuScreen.saveDataObject.data.currency--;
				
					condomText.text = "Préservatifs: " + MainMenuScreen.saveDataObject.data.condomCount.toString();
					starsText.text = "Étoiles: " + MainMenuScreen.saveDataObject.data.currency.toString();
					MainMenuScreen.saveDataObject.flush();
				}
			}
		}
		
		
		private function addMenuBackground(){
			menuBackground = new Image(Main.assets.getTexture("background-orange"));
			addChild( menuBackground );
		}
		
		
		private function addBackButton(){
			backButton = new Image(Main.assets.getTexture("ButtonBack"));
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