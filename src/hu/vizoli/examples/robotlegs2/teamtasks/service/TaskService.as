package hu.vizoli.examples.robotlegs2.teamtasks.service 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseActor;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.TasksModel;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	import hu.vizoli.examples.robotlegs2.teamtasks.service.parser.interfaces.ITaskServiceParser;
	
	/**
	 * TaskService
	 * 
	 * @author vizoli
	 */
	public class TaskService extends BaseActor
	{
		[Inject]
		public var parser:ITaskServiceParser;
		
		[Inject]
		public var taskModel:TasksModel;
		
		private static const TASK_URL:String = "http://vizoli.hu/works/flash_team_tasks/php/task.php";
		
		private var _urlLoader:URLLoader;
		private var _urlRequest:URLRequest;
		private var _urlVariables:URLVariables;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Task listazasa
		 */
		public function getTasksList():void
		{
			this._urlLoader 			= new URLLoader();
			
			this._urlVariables 			= new URLVariables();
			this._urlVariables.action 	= "list";
			
			this._urlRequest 			= new URLRequest( TASK_URL );
			this._urlRequest.method 	= URLRequestMethod.POST; 
			
			this._urlLoader.load( this._urlRequest );
			this._urlLoader.addEventListener( Event.COMPLETE, this.getTasksList_CompleteHandler );
		}
		
		/**
		 * Task hozzaadasa
		 */
		public function addTask( task:TaskVO ):void
		{
			this._urlLoader 			= new URLLoader();
			
			this._urlVariables 			= new URLVariables();
			this._urlVariables.action 	= "add";
			this._urlVariables.memberID = task.member.id;
			this._urlVariables.deadline = task.deadline;
			this._urlVariables.task 	= task.task;
			
			this._urlRequest 			= new URLRequest( TASK_URL );
			this._urlRequest.data 		= this._urlVariables;
			this._urlRequest.method 	= URLRequestMethod.POST; 
			
			this._urlLoader.load( this._urlRequest );
			this._urlLoader.addEventListener( Event.COMPLETE, this.addTask_CompleteHandler );
		}
		
		/**
		 * Task torlese
		 */
		public function removeTask( task:TaskVO ):void
		{
			this._urlLoader = new URLLoader();
			
			this._urlVariables 			= new URLVariables();
			this._urlVariables.action 	= "remove";
			this._urlVariables.taskID 	= task.id;
			
			this._urlRequest 			= new URLRequest( TASK_URL );
			this._urlRequest.data 		= this._urlVariables;
			this._urlRequest.method 	= URLRequestMethod.POST; 
			
			this._urlLoader.load( this._urlRequest );
			this._urlLoader.addEventListener( Event.COMPLETE, this.removeTask_CompleteHandler );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * addTask_CompleteHandler
		 * 
		 * @param	event
		 */
		private function addTask_CompleteHandler( event:Event ):void
		{
			var tasks:Object 		= JSON.parse( event.target.data );
			
			this.taskModel.tasks 	= this.parser.parseListTaskResult( tasks );
		}
		
		/**
		 * removeTask_CompleteHandler
		 * 
		 * @param	event
		 */
		private function removeTask_CompleteHandler( event:Event ):void
		{
			var tasks:Object 		= JSON.parse( event.target.data );
			
			this.taskModel.tasks 	= this.parser.parseListTaskResult( tasks );
		}
		
		/**
		 * getTasksList_CompleteHandler
		 * 
		 * @param	event
		 */
		private function getTasksList_CompleteHandler( event:Event ):void
		{
			var tasks:Object 		= JSON.parse( event.target.data );
			
			this.taskModel.tasks 	= this.parser.parseListTaskResult( tasks );
		}
	}

}