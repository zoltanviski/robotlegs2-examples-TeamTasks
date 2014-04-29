package hu.vizoli.examples.robotlegs2.teamtasks.config 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.AddTaskCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.GetTasksListCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.LoadTeamCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.RemoveTaskCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TeamEvent;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * CommandConfig
	 * 
	 * @author vizoli
	 */
	public class CommandConfig implements IConfig
	{
		[Inject]
		public var commandMap:IEventCommandMap;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Configure
		 */
		public function configure():void
		{
			this.commandMap.map( TeamEvent.GET_TEAM, TeamEvent ).toCommand( LoadTeamCommand );
			this.commandMap.map( TaskEvent.GET_LIST, TaskEvent ).toCommand( GetTasksListCommand );
			this.commandMap.map( TaskEvent.ADD, TaskEvent ).toCommand( AddTaskCommand );
			this.commandMap.map( TaskEvent.REMOVE, TaskEvent ).toCommand( RemoveTaskCommand );
		}
		
	}
	
}