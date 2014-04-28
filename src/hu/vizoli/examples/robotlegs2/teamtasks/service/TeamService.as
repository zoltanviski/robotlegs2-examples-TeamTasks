package hu.vizoli.examples.robotlegs2.teamtasks.service 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseActor;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TeamModel;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITeamServiceParser;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.TeamServiceParser;
	
	/**
	 * Team service-je
	 * 
	 * @author vizoli
	 */
	public class TeamService extends BaseActor
	{
		[Inject]
		public var teamModel:TeamModel;
		
		[Inject]
		public var parser:ITeamServiceParser;
		
		private static const TEAM_URL:String = "http://vizoli.hu/works/flash_team_tasks/php/team.php";
		
		private var _urlLoader:URLLoader;
			
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Load the members
		 */
		public function loadMembers():void
		{
			this._urlLoader = new URLLoader();
			this._urlLoader.load(new URLRequest( TEAM_URL ));
			this._urlLoader.addEventListener( Event.COMPLETE, this.loadMembers_CompleteHandler );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * LoadMembers complete handler
		 * 
		 * @param	e
		 */
		private function loadMembers_CompleteHandler( e:Event ):void
		{
			var members:Object 		= JSON.parse( e.target.data );
			
			this.teamModel.members 	= this.parser.parseMembersResult( members );
		}
		
	}

}