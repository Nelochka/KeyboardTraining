package view
{
	import config.constants.Names;
	import config.constants.NotificationNames;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import model.KeyboardProxy;
	import model.toSaveText.TextForOutput;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class LobbyMediator extends UIMediator
	{
		private static const NAME_LobbyMediator:String = config.constants.Names.NAME_Lobbymediator;
		private var textField: TextField = new TextField;	
		private static var textField1:TextField = new TextField;
		
		
		public function LobbyMediator()
		{
			super(new LobbyViewLogic(new Sprite()));
		}
		public function get content():DisplayObjectContainer
		{
			return viewComponent as DisplayObjectContainer;
		}
		public static function get getTextField():TextField
		{
			return textField1 as TextField; 
		}
		
		override public function listNotificationInterests():Array
		{
			return [config.constants.NotificationNames.PRINT_HELLO_WORLD,
				config.constants.NotificationNames.DOWN_LETTER_TYPED,
				config.constants.NotificationNames.ENTER_PRESSED,
				config.constants.NotificationNames.FORBIDDEN_KEY,
				config.constants.NotificationNames.AROW_PRESSED];
		}
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case config.constants.NotificationNames.PRINT_HELLO_WORLD:
					(uimediator_content as LobbyViewLogic).printHelloWorld(textField);
					uimediator_content.content.addChild(textField);
					break;
				case config.constants.NotificationNames.DOWN_LETTER_TYPED:
					trace ("case 3   "+String.fromCharCode((notification.getBody() as uint)));
					
					var letter:String = String.fromCharCode((notification.getBody() as uint));
					var textField1:TextField=new TextField();
					
					textField1.text=TextForOutput.getInstance().text=TextForOutput.getInstance().text +letter; 
					textField1.textColor = 0xFF0000;
					textField1.width = 250;  
					textField1.x += 25;  
					textField1.y += 25;
					uimediator_content.content.addChild(textField1); 
				break;
				case config.constants.NotificationNames.ENTER_PRESSED:
					trace ("case 4   "+String.fromCharCode((notification.getBody() as uint)));
					
					var num:int = uimediator_content.content.numChildren;
					while (num--)
					{
						uimediator_content.content.removeChildAt(0);
					}
					var textField2:TextField=new TextField();
					textField2.textColor = 0xFF0000;
					textField2.width = 500;  
					textField2.x += 50;  
					textField2.y += 50;
					uimediator_content.content.addChild(textField2);
				break; 
				case config.constants.NotificationNames.FORBIDDEN_KEY:
					trace ("case 5   "+String.fromCharCode((notification.getBody() as uint)));
					
					var textField3:TextField=new TextField();
					textField3.text=config.constants.NotificationNames.FORBIDDEN_KEY;
					uimediator_content.content.addChild(textField3); 
			}
		}
	}
}