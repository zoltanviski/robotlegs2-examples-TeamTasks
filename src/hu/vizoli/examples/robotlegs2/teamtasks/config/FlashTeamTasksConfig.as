package hu.vizoli.examples.robotlegs2.teamtasks.config 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.AddTaskCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.GetTasksListCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.LoadTeamCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.controller.RemoveTaskCommand;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TeamEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TasksModel;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TeamModel;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITaskServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITeamServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.TaskServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.TeamServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TaskService;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TeamService;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.AppletBackgroundMediator;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.AppletBackgroundView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.DeleteTaskIconMediator;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.DeleteTaskIconView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.LogoMediator;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.LogoView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.NewTaskMediator;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.NewTaskView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.TaskListItemMediator;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.TaskListItemView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.TaskListMediator;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.TaskListView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * FlashTeamTasksConfig
	 * 
	 * @author vizoli
	 */
	public class FlashTeamTasksConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
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
			this.injector.map( TasksModel ).asSingleton();
			this.injector.map( TeamModel ).asSingleton();
			this.injector.map( TeamService ).asSingleton();
			this.injector.map( TaskService ).asSingleton();
			this.injector.map( ITeamServiceParser ).toSingleton( TeamServiceParser );
			this.injector.map( ITaskServiceParser ).toSingleton( TaskServiceParser );
			
			this.commandMap.map( TeamEvent.GET_TEAM, TeamEvent ).toCommand( LoadTeamCommand );
			this.commandMap.map( TaskEvent.GET_LIST, TaskEvent ).toCommand( GetTasksListCommand );
			this.commandMap.map( TaskEvent.ADD, TaskEvent ).toCommand( AddTaskCommand );
			this.commandMap.map( TaskEvent.REMOVE, TaskEvent ).toCommand( RemoveTaskCommand );
			
			this.mediatorMap.map( NewTaskView ).toMediator( NewTaskMediator );
			this.mediatorMap.map( TaskListItemView ).toMediator( TaskListItemMediator );
			this.mediatorMap.map( TaskListView ).toMediator( TaskListMediator );
			this.mediatorMap.map( LogoView ).toMediator( LogoMediator );
			this.mediatorMap.map( AppletBackgroundView ).toMediator( AppletBackgroundMediator );
			this.mediatorMap.map( DeleteTaskIconView ).toMediator( DeleteTaskIconMediator );
		}
		
	}
	
}