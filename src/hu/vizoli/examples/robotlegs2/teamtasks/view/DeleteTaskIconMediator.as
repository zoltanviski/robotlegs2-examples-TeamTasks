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
		 * @inheritDoc
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
		 * TaskEvent remove handler
		 * 
		 * @param	e
		 */
		private function taskEvent_RemoveHandler( e:TaskEvent ):void
		{
			this.dispatch( e );
		}
	}

}