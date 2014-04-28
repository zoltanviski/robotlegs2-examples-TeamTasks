package hu.vizoli.examples.robotlegs2.teamtasks.events
{
	import flash.events.Event;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	
	/**
	 * TaskEvent
	 * 
	 * @author vizoli
	 */
	public class TaskEvent extends Event
	{
		public static const GET_LIST:String = "getList";
		public static const ADD:String 		= "add";
		public static const REMOVE:String 	= "remove";
		
		public var task:TaskVO;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TaskEvent
		 * 
		 * @param 	type
		 * @param 	bubbles
		 * @param 	cancelable
		 */
		public function TaskEvent( type:String, task:TaskVO = null )
		{
			super( type );
			
			this.task = task;
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
			return new TaskEvent( type, task );
		}
		
	}
	
}