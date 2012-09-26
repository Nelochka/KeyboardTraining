package model
{
	import config.constants.Names;
	import config.constants.NotificationNames;
	
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class KeyboardProxy extends Proxy
	{
		public static const NAME_proxy:String = config.constants.Names.NAME_proxy;
		public function KeyboardProxy(KeyboardTrainingView: Sprite):void
		{
			super( NAME_proxy,KeyboardTrainingView);
		}
		override public function onRegister():void
		{
			super.onRegister();
			(getData() as Sprite).addEventListener(KeyboardEvent.KEY_DOWN, handlerKeyboard);
			(getData() as Sprite).addEventListener(KeyboardEvent.KEY_UP, handlerKeyboard);
		}
		private function handlerKeyboard(event:KeyboardEvent):void
		{
			if (event.type == KeyboardEvent.KEY_DOWN)
			{
				if ((event.keyCode >=65) && (event.keyCode<=90 )) // добавить & event.shiftKey
				{
					sendNotification (config.constants.NotificationNames.DOWN_LETTER_TYPED, event.charCode);
					trace ("norm_letter");
				}
				else if (event.keyCode==13)
				{
					sendNotification (config.constants.NotificationNames.ENTER_PRESSED, event.charCode);
					trace ("enter");
				}
				else if ((event.keyCode >=37) && (event.keyCode<=40 ))
				{
					sendNotification (config.constants.NotificationNames.AROW_PRESSED, event.charCode);
				}
				else
				{
					sendNotification (config.constants.NotificationNames.FORBIDDEN_KEY, event.keyCode);
					trace ("wrong_one");
				}
			}
			return 
		}
	}
}