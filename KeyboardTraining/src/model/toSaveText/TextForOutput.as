package model.toSaveText
{
	public class TextForOutput
	{
		private static var _text:String;
		private static var _instance:TextForOutput;
		public function TextForOutput()
		{
			super();
		}
		public static function getInstance():TextForOutput 
		{
			if( _instance == null )
			{
				_instance=new TextForOutput();
				_text="";
			}
			return _instance;
		}
		
		public function get text():String
		{
			return _text;
		}
		
		public function set text(value:String):void
		{
			_text = value;
		}
		
	}
}