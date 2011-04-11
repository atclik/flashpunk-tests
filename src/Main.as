package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Engine 
	{
		
		public function Main()
		{
			super(640, 480, 60, false);
			FP.world = new MyWorld;
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!"); 
		}
		
		
	}
	
}