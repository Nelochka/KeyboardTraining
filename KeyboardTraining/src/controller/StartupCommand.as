package controller
{
	import config.constants.NotificationNames;
	
	import flash.display.Sprite;
	
	import model.KeyboardProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.LobbyMediator;
	import view.LobbyViewLogic;
	import view.RootMediator;
	import view.ViewLogic;
	
	public class StartupCommand extends SimpleCommand
	{
		override public function execute(notification: INotification):void
		{
				
			facade.registerMediator(new RootMediator(notification.getBody() as Sprite)); 
			facade.registerProxy( new KeyboardProxy(notification.getBody() as Sprite) );
			facade.registerMediator(new LobbyMediator ());
			sendNotification(config.constants.NotificationNames.PRINT_HELLO_WORLD); 
		}
	}
}