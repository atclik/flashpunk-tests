package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author 
	 */
	public class Myentity2 extends Entity
	{	
		[Embed(source = 'assets/bombe.png')] 
		private const BOMBE:Class;
		
		public function Myentity2(_x:int, _y:int) 
		{
			graphic = new Image(BOMBE);
			setHitbox(45, 45);
			type = "MyEntity2";
			y = _y;
			x = _x;
		}
		
		public function destroy():void 
		{
			
			FP.world.remove(this);
		}
		
		override public function update():void
		{
			y += 1;
			
			if (y > FP.height )
			{
				trace("objet suprimé");
				destroy();
			}
		}
		
	}

}