package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * AppletBackgroundMediator
	 * 
	 * @author vizoli
	 */
	public class AppletBackgroundMediator extends Mediator 
	{
		[Inject]
		public var view:AppletBackgroundView;
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  initialize
		 */
		override public function initialize():void
		{
			
		}
		
	}

}