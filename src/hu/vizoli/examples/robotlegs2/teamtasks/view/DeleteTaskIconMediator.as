package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * DeleteTaskIconMediator
	 * 
	 * @author vizoli
	 */
	public class DeleteTaskIconMediator extends Mediator 
	{
		[Inject]
		public var view:DeleteTaskIconView;
		
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
			this.addViewListener( TaskEvent.REMOVE, this.taskEvent_RemoveHandler, TaskEvent );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * taskEvent_RemoveHandler
		 * 
		 * @param	event
		 */
		private function taskEvent_RemoveHandler( event:TaskEvent ):void
		{
			this.dispatch( event );
		}
	}

}