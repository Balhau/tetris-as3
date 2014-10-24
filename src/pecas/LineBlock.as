package src.pecas
{
	import flash.geom.Point;
	import lib.geometria.coordenadas;
	
	public class LineBlock extends peca
	{
		public function LineBlock()
		{
			super();
			this.drawPeca();
		}
		
		protected override function drawPeca():void
		{
			//posicao vertical
			var c1:coordenadas=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(0,-1));
			c1.addPonto(new Point(0,1));
			c1.addPonto(new Point(0,-2));
			this.addCoordenadas(c1);
			c1=new coordenadas();
			//posicao horizontal
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(-1,0));
			c1.addPonto(new Point(1,0));
			c1.addPonto(new Point(2,0));
			this.addCoordenadas(c1);
		}
	}
}