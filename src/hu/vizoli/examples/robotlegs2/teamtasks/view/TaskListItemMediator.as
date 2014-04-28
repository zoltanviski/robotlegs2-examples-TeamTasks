package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.events.TaskModelEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TasksModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * TaskListItemMediator
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
		 * @inheritDoc
		 */
		override public function initialize():void
		{
			
		}

	}

}