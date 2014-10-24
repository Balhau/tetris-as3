package src.pecas
{
	import fl.motion.Color;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Celula extends Sprite
	{
		private var _ocupada:Boolean;
		public var CorDaPeca:Color;
		
		public function Celula()
		{
			this.ocupada=false;
		}
		
		public function set ocupada(boo:Boolean):void
		{
			_ocupada=boo;
		}
		
		public function get ocupada():Boolean
		{
			return this._ocupada;
		}
	}
}
