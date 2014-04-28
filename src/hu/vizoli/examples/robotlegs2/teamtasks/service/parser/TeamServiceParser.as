package hu.vizoli.examples.robotlegs2.teamtasks.service.parser 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.MemberVO;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITeamServiceParser;
	
	/**
	 * TeamServiceParser
	 * 
	 * @author vizoli
	 */
	public class TeamServiceParser implements ITeamServiceParser
	{
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Parse the members result
		 * 
		 * @param	membersObject
		 */
		public function parseMembersResult( membersObject:Object ):Vector.<MemberVO>
		{
			var members:Vector.<MemberVO> = new Vector.<MemberVO>;
			var memberVO:MemberVO;
			
			for each( var member:Object in membersObject )
			{
				memberVO 			=  new MemberVO();
				memberVO.id 		= member.id;
				memberVO.nickname 	= member.nickname;
				
				members.push( memberVO );
			}
			
			return members;
		}
		
	}

}