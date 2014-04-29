package hu.vizoli.examples.robotlegs2.teamtasks.config 
{
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
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * MediatorConfig
	 * 
	 * @author vizoli
	 */
	public class MediatorConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
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
			this.mediatorMap.map( NewTaskView ).toMediator( NewTaskMediator );
			this.mediatorMap.map( TaskListItemView ).toMediator( TaskListItemMediator );
			this.mediatorMap.map( TaskListView ).toMediator( TaskListMediator );
			this.mediatorMap.map( LogoView ).toMediator( LogoMediator );
			this.mediatorMap.map( AppletBackgroundView ).toMediator( AppletBackgroundMediator );
			this.mediatorMap.map( DeleteTaskIconView ).toMediator( DeleteTaskIconMediator );
		}
		
	}
	
}