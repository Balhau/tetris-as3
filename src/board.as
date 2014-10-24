package src
{
	import fl.motion.Color;
	
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import lib.graficos.desenho;
	import lib.ui.consola;
	import src.pecas.Celula;
	
	/**
	 * Classe que representa o tabuleiro do tetris 
	 * @author balhau
	 * 
	 */	
	public class board extends Sprite
	{
		private var ncellLarg:Number;
		private var ncellAlt:Number;
		private var cellLarg:Number;
		private var cellAlt:Number;
		private var arrCells:Array;
		private var pxadd:uint;
		private var pyadd:uint;
		
		/**
		 * Construtor do tabuleiro 
		 * @param ncellL Número de células na horizontal
		 * @param ncellA Número de células na vertical
		 * @param cellLarg Largura das células
		 * @param cellAlt Altura das células
		 */		
		public function board(ncellL:Number=10,ncellA:Number=20,cellLarg:Number=20,cellAlt:Number=20)
		{
			this.ncellAlt=ncellA;
			this.ncellLarg=ncellL;
			this.cellLarg=cellLarg;
			this.cellAlt=cellAlt;
			this.arrCells=new Array();
			this.drawBoard();
		}
		
		public function get HorizontalCells():Number
		{
			return this.cellLarg;
		}
		
		public function get VerticalCells():Number
		{
			return this.cellAlt;
		}
		
		
		private function apagaLinha(n:Number):void
		{
			var i:Number;
			var j:Number;
			var cellA:Celula;
			var cellB:Celula;
			var cor:Color;
			for(i=n;i>0;i--)
			{
				for(j=0;j<this.ncellLarg;j++)
				{
					cellA=Celula(this.arrCells[i][j]);
					cellB=Celula(this.arrCells[i-1][j]);
					cellA.ocupada=cellB.ocupada;
					cor=cellB.CorDaPeca;
					this.setCellColor(j,i,cor.redMultiplier,cor.greenMultiplier,cor.blueMultiplier);
				}
			}
			for(i=0;i<this.ncellLarg;i++)
			{
				Celula(this.arrCells[0][i]).ocupada=false;
				this.setCellColor(i,0,1,1,1);
			}
		}
		
		/**
		 * Método que efectua o desenho do tabuleiro 
		 * 
		 */		
		private function drawBoard():void
		{
			var cell:Celula;
			for(var i:Number=0;i<this.ncellAlt;i++)
			{
				this.arrCells[i]=new Array();
				for(var j:Number=0;j<this.ncellLarg;j++)
				{
					cell=new Celula();
					cell.addChild(desenho.rectangulo(this.cellAlt,this.cellLarg,0xAAAAAA,0x000000,0.1));
					cell.CorDaPeca=new Color(1,1,1);
					cell.x=j*this.cellLarg;
					cell.y=i*this.cellAlt;
					this.arrCells[i][j]=cell;
					this.addChild(this.arrCells[i][j]);
				}
			}
		}
		
		public function cellOcupationToString():String
		{
			var str:String="";
			for(var i:Number=0;i<this.arrCells.length;i++)
			{
				for(var j:Number=0;j<this.arrCells[i].length;j++)
				{
					str+=" "+this.arrCells[i][j].ocupada;
				}
			}
			return str;
		}
		
		/**
		 * Método responsável por efectuar a troca de cor de uma determinada célula 
		 * @param xpos Posição em x da célula
		 * @param ypos Posição em y da célula
		 * @param r Quantidade de vermelho [0-1]
		 * @param g Quantidade de verde [0-1]
		 * @param b Quantidade de azul [0-1]
		 * 
		 */		
		public function setCellColor(xpos:uint,ypos:uint,r:Number,g:Number,b:Number):void
		{
			if(!cellInBoard(new Point(xpos,ypos)))
				return;
			var cell:Celula=Celula(this.arrCells[ypos][xpos]);
			var colorT:ColorTransform=new ColorTransform(r,g,b);
			cell.transform.colorTransform=colorT;
			cell.CorDaPeca=new Color(r,g,b);
		}
		
		public function setCellOcupada(xpos:uint,ypos:uint,val:Boolean):void
		{
			var cell:Celula=Celula(this.arrCells[ypos][xpos]);
			cell.ocupada=val;
		}
		
		public function setCellArrayOcupada(arrPts:Array,pnto:Point,val:Boolean):void
		{
			for(var i:uint=0;i<arrPts.length;i++)
			{
				this.setCellOcupada(Point(arrPts[i]).x+pnto.x,Point(arrPts[i]).y+pnto.y,val);
			}
		} 
		
		/**
		 * Método responsável por seleccionar um conjunto de células, tendo como base uma determinada célula 
		 * @param arrPts
		 * @param r Componente vermelho
		 * @param g Componente azul
		 * @param b Componente verde
		 * 
		 */		
		public function setCellArrayColor(arrPts:Array,pnto:Point,r:Number,g:Number,b:Number):void
		{
			for(var i:uint=0;i<arrPts.length;i++)
			{
				this.setCellColor(Point(arrPts[i]).x+pnto.x,Point(arrPts[i]).y+pnto.y,r,g,b);
			}
		}
		
		/**
		 * Método que verifica se um determinado ponto se encontra dentro do tabuleiro 
		 * @param pt Ponto representando a localização da célula
		 * @return Verdadeiro caso o ponto se encontre dentro dos limites da célula
		 * 
		 */		
		private function cellInBoard(pt:Point):Boolean
		{
			var verd:Boolean=true;
			if(pt.x<0 || pt.x>=this.ncellLarg)
				verd=false;
			if(pt.y<0 || pt.y>=this.ncellAlt)
				verd=false;
			return verd;
		}
		
		private function cellXInBoard(pt:Point):Boolean
		{
			var verd:Boolean=true;
			if(pt.x<0 || pt.x>=this.ncellLarg)
				verd=false;
			return verd;
		}
		
		private function cellYInBoard(pt:Point):Boolean
		{
			var verd:Boolean=true;
			if(pt.y<0 || pt.y>=this.ncellAlt)
				verd=false;
			return verd;
		}
		
		private function cellHigherYInBoard(pt:Point):Boolean
		{
			if(pt.y>=this.ncellAlt)
			{
				return false;
			}
			return true;		
		}
		
		public function arrCellHigherYInBoard(arr:Array,ptref:Point):Boolean
		{
			var aux:Point=new Point();
			for(var i:uint=0;i<arr.length;i++)
			{
				aux.x=Point(arr[i]).x+ptref.x;
				aux.y=Point(arr[i]).y+ptref.y;
				if(this.cellHigherYInBoard(aux)==false)
				{
						return false;
				}
			}
			return true;
		}
		
		public function arrCellXInBoard(arr:Array,ptref:Point):Boolean
		{
			var aux:Point=new Point();
			for(var i:uint=0;i<arr.length;i++)
			{
				aux.x=Point(arr[i]).x+ptref.x;
				aux.y=Point(arr[i]).y+ptref.y;
				if(!this.cellXInBoard(aux))
					return false;
			}
			return true;
		}
		
		public function arrCellYInBoard(arr:Array,ptref:Point):Boolean
		{
			var aux:Point=new Point();
			for(var i:uint=0;i<arr.length;i++)
			{
				aux.x=Point(arr[i]).x+ptref.x;
				aux.y=Point(arr[i]).y+ptref.y;
				if(!this.cellYInBoard(aux))
					return false;
			}
			return true;
		}
		
		public function arrCellDesocupadas(arr:Array,ptref:Point):Boolean
		{
			var k:Number;
			var l:Number;
			var cell:Celula;
			for(var i:uint=0;i<arr.length;i++)
			{
				k=Point(arr[i]).x+ptref.x;
				l=Point(arr[i]).y+ptref.y;
				if(!this.cellInBoard(new Point(k,l)))
				{
					continue;
				}
				cell=Celula(this.arrCells[l][k]);
				if(cell.ocupada)
				{
					return false;
				}
			}
			return true;
		}
		
		private function linhaCompleta(n:Number):Boolean
		{
			var i:Number;
			for(i=0;i<this.ncellLarg;i++)
			{
				if(!Celula(this.arrCells[n][i]).ocupada)
				{
					return false;
				}
			}
			return true;
		}
		
		public function apagaLinhas():void
		{
			var i:Number;
			var l:Number;
			for(i=this.ncellAlt-1;i>=0;i--)
			{
				if(linhaCompleta(i))
				{
					apagaLinha(i);
					i++;
				}
			}
		}
		
		/**
		 * Método que verifica se um determinado array de pontos se encontra dentro do tabuleiro 
		 * @param arr Array de objectos do tipo Point
		 * @return Verdadeiro caso todos os pontos se encontrem dentro do tabuleiro, falso caso contrário
		 * 
		 */		
		private function arrCellInBoard(arr:Array,ptrf:Point):Boolean
		{
			var aux:Point=new Point();
			for(var i:uint=0;i<arr.length;i++)
			{
				aux.x=arr[i].x+ptrf.x;
				aux.y=arr[i].y+ptrf.y;
				if(!this.cellInBoard(aux))
					return false;
			}
			return true;
		}
	}
}