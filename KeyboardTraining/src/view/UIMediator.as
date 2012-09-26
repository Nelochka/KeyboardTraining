package view
{
	import config.constants.NotificationNames;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class UIMediator extends Mediator
	{
		public static const NAME_UImediator: String=config.constants.Names.NAME_UImediator;
		public function UIMediator(viewElement:ViewLogic)
		{
			super(NAME, viewElement);
		}
		override public function onRegister():void
		{
			super.onRegister();
			sendNotification(config.constants.NotificationNames.ADD_CHILD_TO_ROOT,uimediator_content.content);
		}
		override public function onRemove():void
		{
			super.onRemove();
		}
		public function get uimediator_content():ViewLogic
		{ 
			return viewComponent as ViewLogic; 
		}
		
	}
}