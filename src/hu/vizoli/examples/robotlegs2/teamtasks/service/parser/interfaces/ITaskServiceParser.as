package hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	
	/**
	 * ITaskServiceParser
	 * 
	 * @author vizoli
	 */
	public interface ITaskServiceParser 
	{
		function parseListTaskResult( tasks:Object ):Vector.<TaskVO>;
	}
	
}