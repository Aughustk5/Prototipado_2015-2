package Utils.Objects 
{
	import flash.utils.Dictionary;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import Utils.start.DStarling;
	/**
	 * ...
	 * @author Pupu
	 */
	public class DGameObject extends Sprite
	{
		protected var textures:Vector.<Texture>;
		protected var states:Dictionary;
		protected var alife:Boolean;
		protected var life:int;
		protected var currState:String;
		protected var clip:String;
		private var _centerPivot:Boolean;
		public function DGameObject(_clip:String, centerPivot:Boolean=true, _life:int=100, _alife:Boolean=true) 
		{
			clip = _clip;
			_centerPivot = centerPivot;
			alife = _alife;
			life = _life;
			states = new Dictionary();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		public function addState(key:String, _textures:Vector.<Texture>):void
		{
			states[key] = _textures;
		}
		
		public function startState(_state:String):void
		{
			if (currState == _state) 
			{ 
				return; 
				
			}
			if (getChildAt(0) is MovieClip)
			{
				Starling.juggler.remove(MovieClip(getChildAt(0)));
			}
			removeChildAt(0);
			var texture:Vector.<Texture> = states[_state];
			if (texture.length == 1)
			{
				var skinImage:Image = new Image(texture[0]);
				addChild(skinImage);
			}
			else
			{
				var skinMc:MovieClip = new MovieClip(texture);
				Starling.juggler.add(skinMc);
				addChild(skinMc);
			}
			currState = _state;
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			init();
		}
		
		public function update():void
		{
			if (getChildAt(0) is MovieClip)
			{
				if (MovieClip(getChildAt(0)).currentFrame == 
								MovieClip(getChildAt(0)).numFrames-1)
				{
					onCompleteAnim();
				}
			}
		}
		
		public function onCompleteAnim():void 
		{
			
		}
		
		public function init():void 
		{
			if (_centerPivot)
			{
				alignPivot();
			}
			textures = DStarling.assetsManager.getTextures(clip);
			if (textures.length == 1)
			{
				var skinImage:Image = new Image(textures[0]);
				addChild(skinImage);
			}
			else
			{
				var skinMc:MovieClip = new MovieClip(textures);
				Starling.juggler.add(skinMc);
				addChild(skinMc);
			}
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		private function destroy():void 
		{
			removeChildren();
		}
		
	}

}