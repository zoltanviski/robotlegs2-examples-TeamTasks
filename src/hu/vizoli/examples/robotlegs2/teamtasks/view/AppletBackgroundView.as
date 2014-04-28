package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import flash.display.Sprite;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseView;
	
	/**
	 * AppletBackgroundView
	 * 
	 * @author vizoli
	 */
	public class AppletBackgroundView extends BaseView
	{
		private var _backgroundImage:Sprite;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * AppletBackgroundView
		 */
		public function AppletBackgroundView() 
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
			this._backgroundImage = new Background();
			this.addChild( this._backgroundImage );
		}
		
	}

}