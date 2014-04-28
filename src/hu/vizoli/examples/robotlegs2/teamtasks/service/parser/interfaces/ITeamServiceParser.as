package hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces
{
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.MemberVO;
	
	/**
	 * ITeamServiceParser
	 * 
	 * @author vizoli
	 */
	public interface ITeamServiceParser 
	{
		function parseMembersResult( members:Object ):Vector.<MemberVO>;
	}
	
}