package src.pecas
{
	import flash.geom.Point;
	import lib.geometria.coordenadas;
	
	public class zBlock extends peca
	{
		public function zBlock()
		{
			super();
			drawPeca();
		}
		
		protected override function drawPeca():void
		{
			//Bloco horizontal
			var c1:coordenadas=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(-1,0));
			c1.addPonto(new Point(0,-1));
			c1.addPonto(new Point(1,-1));
			this.addCoordenadas(c1);
			//Bloco vertical
			c1=new coordenadas();
			c1.addPonto(new Point(0,1));
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(-1,0));
			c1.addPonto(new Point(-1,-1)); 
			this.addCoordenadas(c1);
		}
	}
}