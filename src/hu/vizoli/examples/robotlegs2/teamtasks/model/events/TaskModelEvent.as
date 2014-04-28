package hu.vizoli.examples.robotlegs2.teamtasks.model.events
{
	import flash.events.Event;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	
	/**
	 * TaskEvent
	 * 
	 * @author vizoli
	 */
	public class TaskModelEvent extends Event
	{
		public static const UPDATED:String = "updated";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TaskEvent
		 * 
		 * @param 	type
		 */
		public function TaskModelEvent( type:String )
		{
			super( type );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDOc
		 */
		override public function clone( ):Event
		{
			return new TaskModelEvent( type );
		}
		
	}
	
}