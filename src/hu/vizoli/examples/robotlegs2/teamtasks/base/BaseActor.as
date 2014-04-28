package hu.vizoli.examples.robotlegs2.teamtasks.base 
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	/**
	 * BaseActor
	 * 
	 * @author vizoli
	 */
	public class BaseActor
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		protected function dispatch( event:Event ):void
		{
			if ( this.eventDispatcher.hasEventListener( event.type ) )
				this.eventDispatcher.dispatchEvent( event );
		}
	}
}