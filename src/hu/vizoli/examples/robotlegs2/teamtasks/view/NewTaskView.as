package hu.vizoli.examples.robotlegs2.teamtasks.view 
{
	import fl.controls.Button;
	import fl.controls.ButtonLabelPlacement;
	import fl.controls.ComboBox;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import hu.vizoli.examples.robotlegs2.teamtasks.base.BaseView;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.MemberVO;
	import hu.vizoli.examples.robotlegs2.teamtasks.model.vo.TaskVO;
	import hu.vizoli.examples.robotlegs2.teamtasks.events.TaskEvent;
	import nid.ui.controls.DatePicker;
	import nid.ui.controls.datePicker.iconSprite;
	
	/**
	 * NewTaskView
	 * 
	 * @author vizoli
	 */
	
	public class NewTaskView extends BaseView
	{
		[Embed(source = "/../bin/assets/calendar_icon.png")]
		private var _calendarIcon:Class;
	 
		private var _font:Font;
		private var _textFormat:TextFormat;
		private var _datePicker:DatePicker;
		private var _membersCB:ComboBox;
		private var _taskInput:TextField;
		private var _button:Button;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * NewTaskView
		 */
		public function NewTaskView() 
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
			this._membersCB						= new ComboBox();
			this._membersCB.rowCount			= 10;
			this._membersCB.prompt				= "Member";
			this._membersCB.width				= 80;
			this._membersCB.height				= 25;
			this._membersCB.setStyle( "embedFonts", true );
			this._membersCB.setStyle( "textFormat", this._textFormat );
			this.addChild(this._membersCB);
			
			this._datePicker					= new DatePicker();
			this._datePicker.icon				= new _calendarIcon();
			this._datePicker.iconPlacement 		= "left";
			this._datePicker.width				= 100;
			this._datePicker.x 					= this._membersCB.x + this._membersCB.width + 6;
			this.addChild(this._datePicker);
			
			this._taskInput 					= new TextField();
			this._taskInput.opaqueBackground 	= false;
			this._taskInput.backgroundColor 	= 0x333333;
			this._taskInput.background 			= true; 
			this._taskInput.textColor 			= 0x999999;
			this._taskInput.defaultTextFormat 	= this._textFormat;
			this._taskInput.type 				= TextFieldType.INPUT;
			this._taskInput.border 				= true;
			this._taskInput.multiline 			= false;
			this._taskInput.width 				= 300;
			this._taskInput.x 					= this._datePicker.x + 31;
			this._taskInput.height 				= 23;
			this.addChild(this._taskInput);
			
			this._button 						= new Button();
			this._button.label					= "Add";
			this._button.labelPlacement 		= ButtonLabelPlacement.LEFT;
			this._button.useHandCursor			= true;
			this._button.x 						= this._taskInput.x + this._taskInput.width + 6;
			this._button.width 					= 60;
			this._button.height 				= 23;
			this._button.addEventListener(MouseEvent.CLICK, button_ClickHandler);
			this._button.setStyle("icon", AddTaskIcon);
			this._button.setStyle( "embedFonts", true );
			this._button.setStyle( "textFormat", this._textFormat );
			this.addChild(_button);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Set members
		 * 
		 * @param	members
		 */
		public function setMembers( members:Vector.<MemberVO> ):void
		{
			for (var i:Number = 0; i < members.length; i++ )
			{
				this._membersCB.addItem( { label: members[i].nickname, memberVO: members[i] } );
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Returns valid new task or not
		 */
		private function isValidNewTask():Boolean
		{
			if ( this._membersCB.selectedIndex == -1 )
			{
				return false;
			}
			else if ( this._taskInput.text == "" )
			{
				return false;
			}
			else if ( !this._datePicker.selectedDate )
			{
				return false;
			}
			
			return true;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Button click handler
		 * 
		 * @param	event
		 */
		private function button_ClickHandler( e:MouseEvent ):void
		{
			if ( this.isValidNewTask() )
			{
				var newTask:TaskVO 				= new TaskVO();
				newTask.deadline 				= String( this._datePicker.selectedDate.getFullYear() + "-" + ( this._datePicker.selectedDate.getMonth() + 1 ) + "-" + this._datePicker.selectedDate.getDate() );
				newTask.member 					= MemberVO( this._membersCB.selectedItem.memberVO );
				newTask.task					= this._taskInput.text;
				
				var taskEvent:TaskEvent 	= new TaskEvent( TaskEvent.ADD, newTask );
				
				this.dispatchEvent( taskEvent );
			}
		}
		
	}
	
}