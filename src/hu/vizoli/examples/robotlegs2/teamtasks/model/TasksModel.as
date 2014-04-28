package hu.vizoli.examples.robotlegs2.teamtasks.model 
{
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseActor;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.events.TaskModelEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	
	/**
	 * Model of tasks
	 * 
	 * @author vizoli
	 */
	public class TasksModel extends BaseActor
	{
		private var _tasks:Vector.<TaskVO> = new Vector.<TaskVO>( 50, true );
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		public function get tasks():Vector.<TaskVO> 
		{
			return this._tasks;
		}
		
		/**
		 * Returns the tasks
		 * 
		 * @param	 value
		 */
		public function set tasks( value:Vector.<TaskVO> ):void 
		{
			this._tasks = value;
			
			this.dispatch( new TaskModelEvent( TaskModelEvent.UPDATED ) );
		}
	}
}