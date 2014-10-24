package {
	import fl.motion.Color;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import lib.geometria.coordenadas;
	import flash.utils.Timer;
	
	import lib.ui.consola;
	
	import src.board;
	import src.pecas.FactoryPecas;
	import src.pecas.peca;
	
	public class tetris extends Sprite
	{
		private var tmer:Timer;
		private var tempo:Number;
		private var pecaOnBoard:peca;
		private var tbleiro:board;
		private var ptref:Point;
		private var actColor:Color;
		
		public function tetris()
		{
			this.tbleiro=new board(15,15);
			this.tbleiro.y=50;
			this.addChild(this.tbleiro);
			this.tempo=0;
			this.startTetris();
		}
		
		private function movePeca(pt:Point):void
		{
			this.tbleiro.setCellArrayColor(this.pecaOnBoard.getActualCoords().toArrayPoints(),this.ptref,1,1,1);
			this.ptref.x=pt.x;
			this.ptref.y=pt.y;
			this.tbleiro.setCellArrayColor(this.pecaOnBoard.getActualCoords().toArrayPoints(),this.ptref,this.actColor.redMultiplier,this.actColor.greenMultiplier,this.actColor.blueMultiplier);
		}
	
		public function startTetris():void
		{
			this.pecaOnBoard=FactoryPecas.getRandomPeca();
			this.actColor=new Color(Math.random(),Math.random(),Math.random());
			tmer=new Timer(1000);
			tmer.addEventListener(TimerEvent.TIMER,this.tEvento);
			this.tmer.start();
			this.ptref=this.getStartPoint();
			stage.addEventListener(KeyboardEvent.KEY_DOWN,teclado);
		}
		
		private function getStartPoint():Point
		{
			this.actColor=new Color(Math.random(),Math.random(),Math.random());
			return new Point(Math.floor(this.tbleiro.HorizontalCells/2),-2);
		}
		
		private function teclado(ke:KeyboardEvent):void
		{
			var aux:Point;
			switch(ke.keyCode)
			{
				case Keyboard.LEFT:
					aux=new Point(this.ptref.x-1,this.ptref.y);
					if(this.tbleiro.arrCellDesocupadas(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux) && this.tbleiro.arrCellXInBoard(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux))
						movePeca(aux);
					break;
				case Keyboard.RIGHT:
					aux=new Point(this.ptref.x+1,this.ptref.y)
					if(this.tbleiro.arrCellDesocupadas(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux) && this.tbleiro.arrCellXInBoard(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux))
						movePeca(aux);
					break;
				case Keyboard.DOWN:
					aux=new Point(this.ptref.x,this.ptref.y+1);
					if(this.tbleiro.arrCellDesocupadas(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux) && this.tbleiro.arrCellHigherYInBoard(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux))	
						movePeca(aux);
					break;
				case Keyboard.UP:
					aux=new Point(this.ptref.x,this.ptref.y);
					if(this.tbleiro.arrCellDesocupadas(this.pecaOnBoard.NextRotacao.toArrayPoints(),aux) && this.tbleiro.arrCellHigherYInBoard(this.pecaOnBoard.NextRotacao.toArrayPoints(),aux) && this.tbleiro.arrCellXInBoard(this.pecaOnBoard.NextRotacao.toArrayPoints(),aux))
						this.rodaPeca();
				default:
					;
			}
		}
		
		private function rodaPeca():void
		{
			this.tbleiro.setCellArrayOcupada(this.pecaOnBoard.getActualCoords().toArrayPoints(),ptref,false);
			this.tbleiro.setCellArrayColor(this.pecaOnBoard.getActualCoords().toArrayPoints(),ptref,1,1,1);
			this.pecaOnBoard.roda();
			this.tbleiro.setCellArrayColor(this.pecaOnBoard.getActualCoords().toArrayPoints(),this.ptref,this.actColor.redMultiplier,this.actColor.greenMultiplier,this.actColor.blueMultiplier);
		}
		
		public function tEvento(ev:TimerEvent):void
		{
			var aux:Point=new Point(this.ptref.x,this.ptref.y+1);
			//caso em que a peça pode mexer
			if(this.tbleiro.arrCellHigherYInBoard(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux))
			{
				if(this.tbleiro.arrCellDesocupadas(this.pecaOnBoard.getActualCoords().toArrayPoints(),aux))
					movePeca(aux);
				else
				{
						this.tbleiro.setCellArrayOcupada(this.pecaOnBoard.getActualCoords().toArrayPoints(),this.ptref,true);
						this.tbleiro.apagaLinhas();
						this.pecaOnBoard=FactoryPecas.getRandomPeca();
						this.ptref=this.getStartPoint();
						this.pecaOnBoard.CorDaPeca=this.actColor;
				}
			}
			//caso em que a peça já não pode mexer
			else
			{
				this.tbleiro.setCellArrayOcupada(this.pecaOnBoard.getActualCoords().toArrayPoints(),this.ptref,true);
				this.tbleiro.apagaLinhas();
				this.pecaOnBoard=FactoryPecas.getRandomPeca();
				this.ptref=this.getStartPoint();
				this.pecaOnBoard.CorDaPeca=this.actColor;
			}
		}
	}
}
