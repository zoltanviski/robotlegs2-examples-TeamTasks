package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TeamEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TeamModel;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 *  Uj task felvetele Mediator
	 * 
	 * @author vizoli
	 */
	public class NewTaskMediator extends Mediator
	{
		[Inject]
		public var view:NewTaskView;
		
		[Inject]
		public var teamModel:TeamModel;
		
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
			this.addContextListener( TeamEvent.TEAM_LOADED, this.teamEvent_teamLoadedHandler, TeamEvent );
			
			this.addViewListener( TaskEvent.ADD, this.taskEvent_AddHandler, TaskEvent );
			
			this.dispatch( new TeamEvent( TeamEvent.GET_TEAM ) );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  TeamEvent teamLoaded handler
		 * 
		 * @param	e
		 */
		private function teamEvent_teamLoadedHandler( e:TeamEvent ):void
		{
			this.view.setMembers( this.teamModel.members );
		}
		
		/**
		 *  TaskEvent add handler
		 * 
		 * @param	e
		 */
		private function taskEvent_AddHandler( e:TaskEvent ):void
		{
			this.dispatch( e );
		}
		
	}

}