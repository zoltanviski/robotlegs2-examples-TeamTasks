package 
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseView;
	import hu.vizoli.examples.robotlegs2.teamtasks.config.CommandConfig;
	import hu.vizoli.examples.robotlegs2.teamtasks.config.MediatorConfig;
	import hu.vizoli.examples.robotlegs2.teamtasks.config.ModelConfig;
	import hu.vizoli.examples.robotlegs2.teamtasks.config.ServiceConfig;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.AppletBackgroundView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.LogoView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.NewTaskView;
	import hu.vizoli.examples.robotlegs2.teamtasks.view.TaskListView;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	/**
	 * Robotlegs2 Example - Team tasks
	 * 
	 * @author vizoli ( Name: Zoltan Viski, Site: vizoli.hu, Github: https://github.com/zoltanviski )
	 */
	public class Main extends BaseView 
	{
		private var _context:IContext;
		private var _appletBackgroundView:AppletBackgroundView;
		private var _logo:LogoView;
		private var _newTaskView:NewTaskView;
		private var _taskListView:TaskListView;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Main
		 */
		public function Main():void 
		{
			this.setupContext();
				
			if ( this.stage ) this.init();
			else this.addEventListener( Event.ADDED_TO_STAGE, this.init );
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
			this._appletBackgroundView 			= new AppletBackgroundView();
			this._appletBackgroundView.width 	= this.stage.stageWidth;
			this._appletBackgroundView.height 	= this.stage.stageHeight;
			this.addChild( this._appletBackgroundView );
			
			this._logo 							= new LogoView();
			this._logo.x						= ( stage.stageWidth / 2 ) - 357;
			this._logo.y						= 50;
			this.addChild( this._logo );
			
			this._newTaskView 					= new NewTaskView();
			this._newTaskView.x					= this._logo.x + 222;
			this._newTaskView.y					= 87;
			this.addChild( this._newTaskView );
			
			this._taskListView 					= new TaskListView();
			this._taskListView.x				= ( stage.stageWidth / 2 ) - 352;
			this._taskListView.y				= 120;
			this.addChild( this._taskListView );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Setup the context
		 */
		private function setupContext():void
		{
			this._context = new Context()
				.install( 	MVCSBundle )
				.configure( ModelConfig,
							ServiceConfig,
							CommandConfig,
							MediatorConfig,
							new ContextView( this ) 
						   );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Init
		 * 
		 * @param	e
		 */
		private function init( e:Event = null ):void 
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, this.init );
			
			this.stage.scaleMode 	= StageScaleMode.NO_SCALE;
			this.stage.align 		= StageAlign.TOP_LEFT;
				
			this.createChildren();	
		}
		
	}
	
}