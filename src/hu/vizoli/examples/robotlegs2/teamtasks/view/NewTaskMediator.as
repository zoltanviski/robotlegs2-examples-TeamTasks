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
		 *  initialize
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
		 *  teamEvent_teamLoadedHandler
		 * 
		 * @param	event
		 */
		private function teamEvent_teamLoadedHandler( event:TeamEvent ):void
		{
			this.view.setMembers( this.teamModel.members );
		}
		
		/**
		 *  TaskEvent_AddHandler
		 * 
		 * @param	event
		 */
		private function taskEvent_AddHandler( event:TaskEvent ):void
		{
			this.dispatch( event );
		}
		
	}

}