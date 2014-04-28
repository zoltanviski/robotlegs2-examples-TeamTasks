package hu.vizoli.examples.robotlegs2.teamtasks.controller 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TaskService;
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
		 * Execute
		 */
		override public function execute():void
		{
			this.taskService.addTask( this.event.task )
		}
		
	}

}