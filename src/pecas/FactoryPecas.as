package src.pecas
{
	/**
	 * Padrão Factory responsável por instanciar objectos derivados da classe peça. Cada uma das classes derivadas representa um tipo de peça
	 * no tabuleiro do tetris  
	 * @author balhau
	 * 
	 */	
	public class FactoryPecas
	{
		/**
		 * Construtor da classe FactoryPecas 
		 */		
		public function FactoryPecas()
		{
		}
		
		/**
		 * Método estático responsável por criar as classes derivadas 
		 * @param tipo Numero identificando a peça que pretendemos instanciar
		 * @return Objecto do tipo peca, mais propriamente uma das suas classes derivadas
		 * 
		 */				
		public static function getPeca(tipo:Number):peca
		{
			switch(tipo)
			{
				case 0:
					return new quadblock();
					break;
				case 1:
					return new zBlock();
					break;
				case 2:
					return new LBlock();
					break;
				case 3:
					return new LineBlock();
					break;
				case 4:
					return new TBlock();
					break;
				default:
					return new quadblock();
			}
		}
		
		/**
		 * Método que devolve aleatóriamente uma das peças do tabuleiro de tetriz 
		 * @return Objecto do tipo peca, mais propriamente uma das suas classes derivadas
		 * 
		 */		
		public static function getRandomPeca():peca
		{
			return FactoryPecas.getPeca(Math.floor(Math.random()*5));
		}
	}
}