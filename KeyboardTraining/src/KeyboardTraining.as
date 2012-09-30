package
{
	import Facade.FacadeEx;
	import config.constants.Names;
	import config.constants.NotificationNames;
	import flash.display.Sprite;
	import flash.events.Event;
	import controller.StartupCommand;
	
	public class KeyboardTraining extends Sprite
	{
		public function KeyboardTraining()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, handler); // всегда отправляется, не важно, слушает ли кто-то
			//trace ("dcfsdvs");
		}	
		private function handler (event:Event):void 
		{
			var Sprite:Sprite=event.target as Sprite; // получить объект класса, который инициировал событие
			FacadeEx.getInstance().startup(StartupCommand, this); 
		}
	}
}