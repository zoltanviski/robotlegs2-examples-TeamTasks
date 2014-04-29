package hu.vizoli.examples.robotlegs2.teamtasks.config 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TasksModel;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TeamModel;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * ModelConfig
	 * 
	 * @author vizoli
	 */
	public class ModelConfig implements IConfig
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
			this.injector.map( TasksModel ).asSingleton();
			this.injector.map( TeamModel ).asSingleton();
		}
		
	}
	
}