package
{
    import flash.desktop.NativeApplication;
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.geom.Rectangle;
    import flash.system.Capabilities;
    import flash.utils.ByteArray;
    import flash.utils.setTimeout;

    import starling.core.Starling;
    import starling.events.Event;
    import starling.textures.RenderTexture;
    import starling.utils.AssetManager;
    import starling.utils.RectangleUtil;
    import starling.utils.ScaleMode;
    import starling.utils.SystemUtil;
    import starling.utils.formatString;
	
	import org.gestouch.core.Gestouch
	import org.gestouch.input.NativeInputAdapter;
	import org.gestouch.extensions.starling.StarlingDisplayListAdapter;
	import org.gestouch.extensions.starling.StarlingTouchHitTester;
	import starling.display.DisplayObject;

    import utils.ProgressBar;
    import flash.net.SharedObject;

    // This project requires the sources of the "demo" project. Add them either by
    // referencing the "demo/src" directory as a "source path", or by copying the files.
    // The "media" folder of this project has to be added to its "source paths" as well,
    // to make sure the icon and startup images are added to the compiled mobile app.

    public class Main extends Sprite
    {
        private const StageWidth:int  = 426;
        private const StageHeight:int = 240;
        public static var scaleFactor:int; 
        public static var mStarling:Starling;
        private var mBackground:Loader;
        private var mProgressBar:ProgressBar;
		public static var assets:AssetManager;
		
		
		
        public function Main()
        {
            // We develop the game in a *fixed* coordinate system of 320x480. The game might
            // then run on a device with a different resolution; for that case, we zoom the
            // viewPort to the optimal size for any display and load the optimal textures.
			
			
			
            //var iOS:Boolean = SystemUtil.platform == "IOS";
            var stageSize:Rectangle  = new Rectangle(0, 0, StageWidth, StageHeight);
            var screenSize:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
            var viewPort:Rectangle = RectangleUtil.fit(stageSize, screenSize, ScaleMode.SHOW_ALL);
            //var scaleFactor:int = viewPort.width < 480 ? 1 : 2; // midway between 320 and 640
			
			
			trace (viewPort);
			if (viewPort.height <= 240) { scaleFactor = 1 } // 426 x 240
			else if (viewPort.height >= 240 && viewPort.width < 480) { scaleFactor = 2 } // 852 x 480
			else if (viewPort.height >= 480) { scaleFactor = 3 } // 1278 x 720

			
			trace ("scaleFactor", scaleFactor);
            Starling.multitouchEnabled = true; // useful on mobile devices
            Starling.handleLostContext = true; // recommended everywhere when using AssetManager
            //RenderTexture.optimizePersistentBuffers = iOS; // safe on iOS, dangerous on Android

            mStarling = new Starling(Navigator, stage, viewPort, null, "auto", "auto");
            mStarling.stage.stageWidth    = StageWidth;  // <- same size on all devices!
            mStarling.stage.stageHeight   = StageHeight; // <- same size on all devices!
            mStarling.enableErrorChecking = Capabilities.isDebugger;
            mStarling.simulateMultitouch  = false;
            mStarling.addEventListener(starling.events.Event.ROOT_CREATED, function():void
            {
                loadAssets(scaleFactor, startGame);
            });
			
			// Set Swipe Shizzle
			Gestouch.inputAdapter ||= new NativeInputAdapter(stage);
			Gestouch.addDisplayListAdapter(starling.display.DisplayObject, new StarlingDisplayListAdapter());
			Gestouch.addTouchHitTester(new StarlingTouchHitTester(mStarling), -1);
			
            mStarling.start();
            initElements(scaleFactor);
			
            // When the game becomes inactive, we pause Starling; otherwise, the enter frame event
            // would report a very long 'passedTime' when the app is reactivated.

            if (!SystemUtil.isDesktop)
            {
                NativeApplication.nativeApplication.addEventListener(
                        flash.events.Event.ACTIVATE, function (e:*):void { mStarling.start(); });
                NativeApplication.nativeApplication.addEventListener(
                        flash.events.Event.DEACTIVATE, function (e:*):void { mStarling.stop(true); });
            }
        }

		private function loadAssets(scaleFactor:int, onComplete:Function):void
		{
			// Our assets are loaded and managed by the 'AssetManager'. To use that class,
			// we first have to enqueue pointers to all assets we want it to load.

			var appDir:File = File.applicationDirectory;
			assets = new AssetManager(scaleFactor);

			assets.verbose = Capabilities.isDebugger;
			assets.enqueue(
					appDir.resolvePath("audio"),
					appDir.resolvePath(formatString("assets/{0}x", scaleFactor))
			);

            // Now, while the AssetManager now contains pointers to all the assets, it actually
            // has not loaded them yet. This happens in the "loadQueue" method; and since this
            // will take a while, we'll update the progress bar accordingly.

            assets.loadQueue(function(ratio:Number):void
            {
                mProgressBar.ratio = ratio;
                if (ratio == 1) onComplete(assets);
            });
        }

        private function startGame(assets:AssetManager):void
        {
            var navigator:Navigator = mStarling.root as Navigator;
            navigator.start(assets);
            setTimeout(removeElements, 150); // delay to make 100% sure there's no flickering.
        }

        private function initElements(scaleFactor:int):void
        {
            // Add background image. By using "loadBytes", we can avoid any flickering.
			
// Insert splash screen here
            var bgPath:String = formatString("assets/{0}x/background-orange.png", scaleFactor); //formatString("assets/{0}x/background.jpg", scaleFactor);
            var bgFile:File = File.applicationDirectory.resolvePath(bgPath);
            var bytes:ByteArray = new ByteArray();
            var stream:FileStream = new FileStream();
            stream.open(bgFile, FileMode.READ);
            stream.readBytes(bytes, 0, stream.bytesAvailable);
            stream.close();

            mBackground = new Loader();
            mBackground.loadBytes(bytes);
            mBackground.scaleX = 1.0 / scaleFactor;
            mBackground.scaleY = 1.0 / scaleFactor;
            mStarling.nativeOverlay.addChild(mBackground);

            mBackground.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE,
                function(e:Object):void
                {
                    (mBackground.content as Bitmap).smoothing = true;
                });

// While the assets are loaded, we will display a progress bar.

			mProgressBar = new ProgressBar(175, 20);
            mProgressBar.x = (StageWidth - mProgressBar.width) / 2;
            mProgressBar.y =  StageHeight * 0.7;
            mStarling.nativeOverlay.addChild(mProgressBar);
        }

		public function getAssets(){
			return assets;
			}
		
		
        private function removeElements():void
        {
            if (mBackground)
            {
                mStarling.nativeOverlay.removeChild(mBackground);
                mBackground = null;
            }

            if (mProgressBar)
            {
                mStarling.nativeOverlay.removeChild(mProgressBar);
                mProgressBar = null;
            }
        }
    }
}