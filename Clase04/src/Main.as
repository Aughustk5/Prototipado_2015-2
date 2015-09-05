package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author Pupu
	 */

	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/bgLayer1.png");
			assets.push("assets/bgWelcome.png");
			assets.push("assets/mySpritesSheet.png");
			assets.push("assets/mySpritesSheet.xml");
			DStarling.init(Game, stage, assets);
		}
		
	}
	
}