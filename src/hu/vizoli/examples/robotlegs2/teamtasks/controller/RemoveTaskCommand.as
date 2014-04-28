package hu.vizoli.examples.robotlegs2.teamtasks.controller 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TaskService;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * RemoveTaskCommand
	 * 
	 * @author vizoli
	 */
	public class RemoveTaskCommand extends Command
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
			this.taskService.removeTask( this.event.task )
		}
		
	}

}