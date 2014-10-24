package src.pecas
{
	import flash.geom.Point
	import lib.geometria.coordenadas;
	
	/**
	 * Classe que representa a peça de tetris com a forma de quadrado
	 * Forma:
	 * _ _
	 * _ _
	 * End Forma:
	 * @author balhau
	 * 
	 */	
	public class quadblock extends peca
	{
		public function quadblock()
		{
			super();
			this.drawPeca();
		}
		
		/**
		 * Método privado responsável por construir as coordenadas do quadrado 
		 * 
		 */		
		protected override function drawPeca():void
		{
			var c1:coordenadas=new coordenadas();
			c1.addPonto(new Point(0,0));
			c1.addPonto(new Point(0,1));
			c1.addPonto(new Point(1,0));
			c1.addPonto(new Point(1,1));
			this.addCoordenadas(c1);
		}
		
		/**
		 * Override do método toString presente na classe pai "peca"   
		 * @return String uma string com uma breve descrição do objecto e suas coordenadas
		 * 
		 */		
		public override function toString():String
		{
			return "Coordenadas do Bloco: "+this.getCoordenadas(0).toString();
		}
	}
}