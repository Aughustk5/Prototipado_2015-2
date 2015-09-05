package 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	import Utils.State.DState;
	import Utils.time.DTempo;
	
	/**
	 * ...
	 * @author Pupu
	 */
	public class Game extends Sprite
	{
		private static var timer:Timer;
		private var monsters:int=0;
		private var elapsed:Number;
		
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
			stage.addEventListener(Event.ENTER_FRAME, loop);
			
			var scene:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("scene1"));
			addChild(scene);
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
			monsters = 0;
			elapsed=0
			DTempo.init();
			
			
			/*timer= new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();*/
		}
		
		private function loop(e:Event):void 
		{
			DTempo.update();
			elapsed += DTempo.dt;
			if (elapsed >= 1)
			{
				trace(elapsed);
				elapsed = 0;
				trace(monsters);
				if (monsters > 1 && monsters % 4 == 0)
				{
					var _coin:MovieClip = new MovieClip(DStarling.assetsManager.getTextures('coin'));
					addChild(_coin);
					_coin.x = Math.random() * stage.stageWidth;
					_coin.y = Math.random() * stage.stageHeight;
					_coin.name = 'coin2';
					monsters = 0;
				}
				else 
				{
					var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"),24);
					addChild(mc);
					Starling.juggler.add(mc);
					mc.x = Math.random() * stage.stageWidth;
					mc.y = Math.random() * stage.stageHeight;
					mc.name = 'green';
					mc.addEventListener(TouchEvent.TOUCH, onTouch);
					monsters++;
				}
			}
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			var mc:MovieClip = e.currentTarget as MovieClip;
			var touch:Touch=e.getTouch(mc);
			if (touch != null)
			{
				if (touch.phase == TouchPhase.BEGAN)
				{
					trace(e.target);
					var content:DisplayObject = e.target as DisplayObject;
					if (content.name == 'coin' || content.name == 'green')
					{
						removeChild(content);
					}
					
					/*removeChild(mc);
					Starling.juggler.remove(mc);
					mc.removeEventListener(TouchEvent.TOUCH, onTouch);
					numEnemy--;*/
				}
			}
		}
		
	}

}