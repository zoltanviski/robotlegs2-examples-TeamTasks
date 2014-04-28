package hu.vizoli.examples.robotlegs2.teamtasks.controller 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TaskService;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * GetTasksListCommand
	 * 
	 * @author vizoli
	 */
	public class GetTasksListCommand extends Command 
	{
		[Inject]
    	public var taskService:TaskService;
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Execute
		 */
		override public function execute():void
		{
			this.taskService.getTasksList();
		}
		
	}

}