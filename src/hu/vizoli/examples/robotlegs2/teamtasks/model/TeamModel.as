package hu.vizoli.examples.robotlegs2.teamtasks.model 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseActor;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TeamEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.MemberVO;
	/**
	 * Csapattagokat tarolo osztaly
	 * 
	 * @author vizoli
	 */
	public class TeamModel extends BaseActor
	{
		private var _members:Vector.<MemberVO> = new Vector.<MemberVO>( 50, true );
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TeamModel
		 */
		public function TeamModel() 
		{
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		public function get members():Vector.<MemberVO> 
		{
			return this._members;
		}
		
		/**
		 * Returns the members
		 * 
		 * @param	 value
		 */
		public function set members( value:Vector.<MemberVO> ):void 
		{
			this._members = value;
			
			this.dispatch( new TeamEvent( TeamEvent.TEAM_LOADED ) );
		}
		
	}

}