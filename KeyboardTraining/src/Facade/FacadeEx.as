package Facade
{
	import flash.display.Sprite;
	import config.constants.Names;
	import config.constants.NotificationNames;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class FacadeEx extends Facade
	{
		private static var _instance:FacadeEx;
		public function FacadeEx()
		{
			super();
		}
		public static function getInstance():FacadeEx 
		{
			if( _instance == null )
			{
				_instance=new FacadeEx();
			}
			return _instance;
		}
		public function startup( KeyboardTraining:Class, KeyboardTrainingView:Sprite ):void 
		{
			registerCommand(config.constants.NotificationNames.STARTUP_COMMAND, KeyboardTraining);
			sendNotification(config.constants.NotificationNames.STARTUP_COMMAND, KeyboardTrainingView);
		}
	}
}