package hu.vizoli.examples.robotlegs2.teamtasks.service.parser 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.MemberVO;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITaskServiceParser;
	
	/**
	 * TaskServiceParser
	 * 
	 * @author vizoli
	 */
	public class TaskServiceParser implements ITaskServiceParser
	{
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Parse the list task result
		 * 
		 * @param	tasksObject
		 */
		public function parseListTaskResult( tasksObject:Object ):Vector.<TaskVO>
		{
			var tasks:Vector.<TaskVO> = new Vector.<TaskVO>;
			var taskVO:TaskVO;
			var memberVO:MemberVO;
			
			for each( var task:Object in tasksObject )
			{
				memberVO 			= new MemberVO();
				memberVO.nickname 	= task.nickname;
				
				taskVO 				=  new TaskVO();
				taskVO.id 			= task.id;
				taskVO.member 		= memberVO;
				taskVO.deadline 	= task.deadline;
				taskVO.task 		= task.task;
				
				tasks.push( taskVO );
			}
			
			return tasks;
		}
		
	}

}