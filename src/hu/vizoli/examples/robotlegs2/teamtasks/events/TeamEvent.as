package hu.vizoli.examples.robotlegs2.teamtasks.events 
{
	import flash.events.Event;
	
	/**
	 * TeamEvent
	 * 
	 * @author vizoli
	 */
	public class TeamEvent extends Event
	{
		public static const GET_TEAM:String 	= "getTeam";
		public static const TEAM_LOADED:String 	= "teamLoaded";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TeamEvent
		 * 
		 * @param 	type
		 */
		public function TeamEvent( type:String )
		{
			super( type );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function clone( ):Event
		{
			return new TeamEvent( type );
		}
		
	}
	
}