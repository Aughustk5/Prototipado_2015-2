package 
{
	import Utils.State.DState;
	/**
	 * ...
	 * @author Pupu
	 */
	public class MainGame extends DState
	{
		private var hero:Hero;
		
		public function MainGame() 
		{
			super();
		}
		
		override public function init():void
		{
			super.init();
			trace('holi');
			hero = new Hero();
			addChild(hero);
		}
		
		override public function update():void
		{
			hero.update();
		}
		
	}

}