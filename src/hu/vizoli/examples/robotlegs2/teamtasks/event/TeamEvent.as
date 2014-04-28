package hu.vizoli.examples.robotlegs2.teamtasks.event 
{
	import flash.events.Event;
	
	/**
	 * TeamEvent
	 * 
	 * @author vizoli
	 */
	public class TeamEvent extends Event
	{
		public static const GET_TEAM:String = "getTeam";
		public static const TEAM_LOADED:String = "teamLoaded";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TeamEvent
		 * 
		 * @param 	type
		 * @param 	bubbles
		 * @param 	cancelable
		 */
		public function TeamEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * clone
		 */
		override public function clone():Event
		{
			return new TeamEvent(type, bubbles, cancelable);
		}
		
	}
	
}