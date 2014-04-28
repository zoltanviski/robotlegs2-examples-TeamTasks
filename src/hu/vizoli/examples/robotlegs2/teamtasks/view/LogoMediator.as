package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * LogoMediator
	 * 
	 * @author vizoli
	 */
	public class LogoMediator extends Mediator
	{
		[Inject]
		public var view:LogoView;
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function initialize():void
		{
			
		}
		
	}

}