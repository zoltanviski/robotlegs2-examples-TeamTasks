package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import flash.display.Sprite;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseView;
	
	/**
	 * LogoView
	 * 
	 * @author vizoli
	 */
	public class LogoView extends BaseView 
	{
		private var _logo:Sprite;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * LogoView
		 */
		public function LogoView() 
		{
			super();
			
			this.createChildren();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function createChildren():void
		{
			this._logo = new Logo();
			this.addChild( this._logo );
		}
		
	}

}