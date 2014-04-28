package hu.vizoli.examples.robotlegs2.teamtasks.controller 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.service.TeamService;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * Team betoltese
	 * 
	 * @author vizoli
	 */
	public class LoadTeamCommand extends Command
	{
		[Inject]
		public var teamService:TeamService;
		
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
			this.teamService.loadMembers();
		}
		
	}

}