package 
{
	import Utils.input.DKeyboard;
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
			addState("walk", DStarling.assetsManager.getTextures("mc_Ball_Walk00"));
			addState("jumpUp", DStarling.assetsManager.getTextures("mc_Ball_JumpUp000"));
			addState("jumpDown", DStarling.assetsManager.getTextures("mc_Ball_JumpDown000"));
			addState("disappear", DStarling.assetsManager.getTextures("mc_Ball_Disappear000"));
			currState = "appear";
		}
		
		override public function update():void
		{
			super.update();
			if (DKeyboard.leftPress)
			{
				x -= 5;
				startState("walk");
			}
			if (DKeyboard.rightPress)
			{
				x += 5;
				startState("walk");
			}
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