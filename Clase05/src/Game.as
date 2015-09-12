package 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import Utils.State.DStateManager;
	
	/**
	 * ...
	 * @author Pupu
	 */
	public class Game extends Sprite
	{
		
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		public function start():void
		{
			DStateManager.init(this);
			DStateManager.register("Game", MainGame);
			DStateManager.start("Game");
		}
		
	}

}