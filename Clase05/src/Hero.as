package 
{
	import Utils.Objects.DGameObject;
	import Utils.start.DStarling;
	/**
	 * ...
	 * @author Pupu
	 */
	public class Hero extends DGameObject
	{
		
		public function Hero() 
		{
			super("mc_Ball_Appear000");
			
			addState("appear", DStarling.assetsManager.getTextures("mc_Ball_Appear000"));
			addState("stand", DStarling.assetsManager.getTextures("mc_Ball_Stand00"));
			currState = "appear";
		}
		
		override public function onCompleteAnim():void
		{
			switch (currState) 
			{
				case "appear":
					startState("stand");
				break;
				default:
			}
		}
		
	}

}