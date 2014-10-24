package src.pecas
{
	import fl.motion.Color;
	import lib.geometria.coordenadas;
	
	public class peca
	{
		private var arrCord:Array;
		private var kRot:uint;
		private var corPeca:Color;
		
		public function peca()
		{
			this.arrCord=new Array();
		}
		
		public function set CorDaPeca(cor:Color):void
		{
			this.corPeca=cor;
		}
		
		public function get CorDaPeca():Color
		{
			return this.corPeca;
		}
		
		public function get NextRotacao():coordenadas
		{
			return this.arrCord[(this.kRot+1)%this.arrCord.length];
		}
		
		public function getCoordenadas(ind:uint):coordenadas
		{
			if(ind>=0 && ind<this.arrCord.length)
				return coordenadas(this.arrCord[ind]);
			return null;
		}
		
		public function addCoordenadas(cord:coordenadas):void
		{
			this.arrCord.push(cord);
			this.kRot=0;
		}
		
		public function roda():void
		{
			if(this.arrCord.length==0)
				return;
			this.kRot=(this.kRot+1)%this.arrCord.length;			
		}
		
		public function getActualCoords():coordenadas
		{
			return coordenadas(this.arrCord[this.kRot]);
		}
		
		public function toString():String
		{
			return "O método toString() não está a devolver qualquer tipo de informação sobre a peça!";
		}
		
		protected function drawPeca():void
		{
			//Este método deverá sofrer um override
		} 
	}
}