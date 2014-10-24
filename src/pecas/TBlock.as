package src.pecas
{
	import flash.geom.Point;
	import lib.geometria.coordenadas;
	
	public class TBlock extends peca
	{
		public function TBlock()
		{
			super();
			this.drawPeca();
		}
		
		protected override function drawPeca():void
		{
			var c1:coordenadas=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(-1,0));
			c1.addPonto(new Point(1,0));
			c1.addPonto(new Point(0,1));
			this.addCoordenadas(c1);
			c1=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(0,-1));
			c1.addPonto(new Point(0,1));
			c1.addPonto(new Point(-1,0));
			this.addCoordenadas(c1);
			c1=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(0,-1));
			c1.addPonto(new Point(-1,0));
			c1.addPonto(new Point(1,0));
			this.addCoordenadas(c1);
			c1=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(1,0));
			c1.addPonto(new Point(0,-1));
			c1.addPonto(new Point(0,1));
			this.addCoordenadas(c1);
			c1=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(-1,0));
			c1.addPonto(new Point(1,0));
			c1.addPonto(new Point(0,1));
		} 

	}
}