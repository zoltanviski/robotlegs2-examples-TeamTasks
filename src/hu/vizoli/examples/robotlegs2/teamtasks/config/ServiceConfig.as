package hu.vizoli.examples.robotlegs2.teamtasks.config 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITaskServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITeamServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.TaskServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.TeamServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TaskService;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TeamService;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * ServiceConfig
	 * 
	 * @author vizoli
	 */
	public class ServiceConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
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
			this.injector.map( TeamService ).asSingleton();
			this.injector.map( TaskService ).asSingleton();
			this.injector.map( ITeamServiceParser ).toSingleton( TeamServiceParser );
			this.injector.map( ITaskServiceParser ).toSingleton( TaskServiceParser );
		}
		
	}
	
}