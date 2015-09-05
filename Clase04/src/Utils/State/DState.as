package Utils.State
{
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import Utils.start.DStarling;
	/**
	 * ...
	 * @author Pupu
	 */
	public class DState extends Sprite
	{
		protected var skin:Image;
		protected var clip:String;
		public function DState(_clip:String) 
		{
			clip = _clip;
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			init();
			addEventListener(Event.ADDED_TO_STAGE, removed);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, removed);
			destroy();
		}
		
		private function destroy():void 
		{
			removeChildren();
		}
		
		public function init():void 
		{
			if (clip != '')
			{
				skin = new Image(DStarling.assetsManager.getTexture(clip));
				addChild(skin);
			}
			else
			{
				var quad:Quad = new Quad(stage.stageWidth, stage.stageHeight, 0x00fff0);
				addChild(quad);
			}
		}
		
	}

}