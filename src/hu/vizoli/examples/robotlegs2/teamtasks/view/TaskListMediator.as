package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.events.TaskModelEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TasksModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * TaskListMediator
	 * 
	 * @author vizoli
	 */
	public class TaskListMediator extends Mediator
	{
		[Inject]
		public var view:TaskListView;
		
		[Inject]
		public var taskModel:TasksModel;
		
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
			this.addContextListener( TaskModelEvent.UPDATED, this.taskModelEvent_UpdateHandler, TaskModelEvent );
			
			this.dispatch( new TaskEvent( TaskEvent.GET_LIST ) );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * taskModelEvent_UpdateHandler
		 * 
		 * @param	event
		 */
		private function taskModelEvent_UpdateHandler( event:TaskModelEvent ):void
		{
			this.view.createTaskItems( this.taskModel.tasks );
		}
		
	}

}