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
	
	/**
	 * ...
	 * @author Pupu
	 */
	public class Game extends Sprite
	{
		private static var numEnemy:int = 0;
		private static var timer:Timer;
		
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
			var scene:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("scene1"));
			addChild(scene);
			
			timer= new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			
			//
			
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			if (timer.currentCount%4==0)
			{
				var _coin:MovieClip = new MovieClip(DStarling.assetsManager.getTextures('coin'));
				addChild(_coin);
				_coin.x = Math.random() * stage.stageWidth;
				_coin.y = Math.random() * stage.stageHeight;
				
				//
				
				_coin.name = 'coin';
			}
			
			else
			{
				var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"),24);
				addChild(mc);
				Starling.juggler.add(mc);
				mc.x = Math.random() * stage.stageWidth;
				mc.y = Math.random() * stage.stageHeight;
				
				mc.addEventListener(TouchEvent.TOUCH, onTouch);
				numEnemy++;
				trace(numEnemy);
				
				//
				
				mc.name = 'green';
			}
			
			/*if (numEnemy >= 20)
			{
				trace('game over');
				var _over:MovieClip = new MovieClip(DStarling.assetsManager.getTextures('game_over'));
				addChild(_over);
				_over.x = stage.stageWidth / 2 - 120;
				_over.y = stage.stageHeight / 2 - 50;
				
				removeChild(mc);
				Starling.juggler.remove(mc);
				timer.removeEventListener(TimerEvent.TIMER, onTimer);
			}*/
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			//var mc:MovieClip = e.currentTarget as MovieClip;
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