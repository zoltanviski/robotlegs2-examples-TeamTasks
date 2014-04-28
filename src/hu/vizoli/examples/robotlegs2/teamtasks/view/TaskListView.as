package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import flash.display.Sprite;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseView;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	
	/**
	 * TaskListView
	 * 
	 * @author vizoli
	 */
	public class TaskListView extends BaseView
	{
		private var _itemsHolder:Sprite;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * TaskListView
		 */
		public function TaskListView() 
		{
			super();
			
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
			this._itemsHolder = new Sprite();
			this.addChild( this._itemsHolder );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Create task items
		 * 
		 * @param	tasks
		 */
		public function createTaskItems( tasks:Vector.<TaskVO> ):void
		{
			this.clearItemsHolder();
			
			var taskListItemView:TaskListItemView;
			
			for each( var task:TaskVO in tasks )
			{
				taskListItemView = new TaskListItemView();
				taskListItemView.y = this._itemsHolder.numChildren * 28;
				taskListItemView.setFields ( task );
				this._itemsHolder.addChild( taskListItemView );
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Clear items holder
		 */
		private function clearItemsHolder():void
		{
			while ( this._itemsHolder.numChildren > 0 ) {
				this._itemsHolder.removeChildAt(0);
			}
		}
		
	}

}