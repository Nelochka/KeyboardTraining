package view
{
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	
	public class LobbyViewLogic extends ViewLogic
	{
		public function LobbyViewLogic(graphics:DisplayObjectContainer)
		{
			super(graphics);
		}
		public function printHelloWorld(textField:TextField):void
		{
			//var textField: TextField = new TextField;
			textField.text="PRESS_ENTER_TO_START";	
			textField.width = 500;  
			textField.x = 100;
			textField.y = 100;
		}
	}
}