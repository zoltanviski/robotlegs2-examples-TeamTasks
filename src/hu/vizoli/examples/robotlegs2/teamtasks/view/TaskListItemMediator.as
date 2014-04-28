package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.events.TaskModelEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TasksModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * TaskListsMediator
	 * 
	 * @author vizoli
	 */
	public class TaskListItemMediator extends Mediator
	{
		[Inject]
		public var view:TaskListItemView;
		
		[Inject]
		public var taskModel:TasksModel;
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * initialize
		 */
		override public function initialize():void
		{
			
		}

	}

}