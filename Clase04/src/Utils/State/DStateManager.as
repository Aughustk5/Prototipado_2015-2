package Utils.State 
{
	import flash.utils.Dictionary;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Ryo
	 */
	public class DStateManager 
	{
		private static var states:Dictionary;
		private static var parent:Sprite;
		private static var current:DState;
		
		public static function init(_parent:Sprite):void {
			states = new Dictionary();
			parent = _parent;
		}
		
		public static function register(key:String,value:Class):void {
			states[key] = value;
		}
		
		public function start(key:String):void {
			if (current != null) {
				parent.removeChild(current);
			}
			current = new states[key] ();
			parent.addChild(current);
		}
		
	}

}