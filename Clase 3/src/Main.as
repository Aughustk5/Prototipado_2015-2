package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.display.MovieClip;
	import starling.utils.AssetManager;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author Pupu
	 */
	
	 [SWF(frameRate = 60, height = 600, width = 480)]
	public class Main extends Sprite 
	{
		private var asset:AssetManager;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/scene1.png");
			assets.push("assets/coin.png");
			assets.push("assets/game_over.png");
			assets.push("assets/spriteSheet.png");
			assets.push("assets/spriteSheet.xml");
			DStarling.init(Game, stage, assets, startGame);
		}
		
		private function startGame():void
		{
			
		}
		
	}
	
}