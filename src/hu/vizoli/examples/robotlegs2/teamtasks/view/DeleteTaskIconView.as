package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseView;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	
	/**
	 * DeleteTaskIconView
	 * 
	 * @author vizoli
	 */
	public class DeleteTaskIconView extends BaseView 
	{
		private var _icon:Sprite;
		public var _task:TaskVO;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * DeleteTaskIconView
		 */
		public function DeleteTaskIconView() 
		{
			super();
			
			this.addEventListener( MouseEvent.CLICK, this.deleteTaskIcon_ClickHandler );
			
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
			this._icon = new DeleteTaskIcon();
			this.addChild( this._icon );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * deleteTaskIcon_ClickHandler
		 * 
		 * @param	event
		 */
		private function deleteTaskIcon_ClickHandler( event:MouseEvent ):void
		{
			var taskVO:TaskVO 	= new TaskVO();
			taskVO.id 			= this._task.id;
			
			this.dispatchEvent( new TaskEvent( TaskEvent.REMOVE, taskVO ) );
		}
		
	}

}