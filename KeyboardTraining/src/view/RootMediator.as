package view
{
	import config.constants.NotificationNames;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class RootMediator extends Mediator
	{
		public static const NAME_mediator: String=config.constants.Names.NAME_mediator;
		public function RootMediator(KeyboardTrainingView:Sprite):void
		{
			super (NAME_mediator, KeyboardTrainingView);
		}
		private function get content():DisplayObjectContainer
		{
			return viewComponent as DisplayObjectContainer;
		}
		
		override public function listNotificationInterests():Array
		{  
			return [config.constants.NotificationNames.ADD_CHILD_TO_ROOT,
				config.constants.NotificationNames.REMOVE_CHILD_FROM_ROOT];
		}
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case config.constants.NotificationNames.ADD_CHILD_TO_ROOT:
					content.addChild(notification.getBody() as DisplayObjectContainer);
					break;
				case config.constants.NotificationNames.REMOVE_CHILD_FROM_ROOT:
					if( content && content.parent )
					{
						content.parent.removeChild( content );
					}
					break;
			}
		}
	}
}