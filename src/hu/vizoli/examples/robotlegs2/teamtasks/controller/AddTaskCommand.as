package hu.vizoli.examples.robotlegs2.teamtasks.controller 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TaskService;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * AddTaskCommand
	 * 
	 * @author vizoli
	 */
	public class AddTaskCommand extends Command
	{	
		[Inject]
    	public var event:TaskEvent;
		
		[Inject]
    	public var taskService:TaskService;
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * execute
		 */
		override public function execute():void
		{
			this.taskService.addTask( this.event.task )
		}
		
	}

}