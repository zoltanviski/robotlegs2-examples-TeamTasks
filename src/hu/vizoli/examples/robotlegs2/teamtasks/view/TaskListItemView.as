package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseView;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	
	/**
	 * TaskListItemView
	 * 
	 * @author vizoli
	 */
	public class TaskListItemView extends BaseView
	{
		private var _font:Font;
		private var _textFormat:TextFormat;
		private var _background:Sprite;
		private var _deleteTaskIcon:DeleteTaskIconView;
		private var _task:TaskVO;
		private var _memberTF:TextField;
		private var _deadlineTF:TextField;
		private var _taskTF:TextField;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TaskListItemView
		 */
		public function TaskListItemView() 
		{
			super();
			
			this._font 				= new TFFonts();
			
			this._textFormat 		= new TextFormat();
			this._textFormat.size	= 14;
			this._textFormat.font 	= this._font.fontName;
			
			this.createChildren();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function createChildren():void
		{
			this._background					= new TaskListItemBackground();
			this._background.alpha 				= 0.9;
			this.addChild( this._background );
			
			this._deleteTaskIcon				= new DeleteTaskIconView();
			this._deleteTaskIcon.buttonMode		= true;
			this._deleteTaskIcon.x 				= 670;
			this._deleteTaskIcon.y 				= 5;
			this.addChild( this._deleteTaskIcon );
			
			this._memberTF 						= new TextField();
			this._memberTF.defaultTextFormat 	= this._textFormat;
			this._memberTF.x 					= 20;
			this._memberTF.y 					= 5;
			this._memberTF.width 				= 60;
			this.addChild( this._memberTF );
			
			this._taskTF 						= new TextField();
			this._taskTF.autoSize				= "left"
			this._taskTF.defaultTextFormat 		= this._textFormat;
			this._taskTF.x 						= this._memberTF.x + this._memberTF.width + 10;
			this._taskTF.y 						= 5;
			this._taskTF.width 					= 100;
			this.addChild( this._taskTF );
			
			this._deadlineTF 					= new TextField();
			this._deadlineTF.autoSize			= "left"
			this._deadlineTF.defaultTextFormat 	= this._textFormat;
			this._deadlineTF.x 					= 600;
			this._deadlineTF.y 					= 5;
			this._deadlineTF.width 				= 100;
			this.addChild( this._deadlineTF );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Set fields
		 * 
		 * @param	task
		 */
		public function setFields( task:TaskVO ):void
		{
			this._task 					= task;
			this._memberTF.text 		= this._task.member.nickname;
			this._taskTF.text 			= this._task.task;
			this._deadlineTF.text 		= this._task.deadline;
			this._deleteTaskIcon._task 	= task;
		}
		
	}

}