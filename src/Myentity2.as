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
		
		public function Myentity2() 
		{
			graphic = new Image(BOMBE);
			setHitbox(90, 90);
			type = "MyEntity2";
			y = 200;
			x = 300;
		}
		
		public function destroy():void 
		{
			FP.world.remove(this);
		}
		
		override public function update():void
		{
			trace("MyEntity2 updates.");
			
			if (Input.check(Key.R))
			{
				y = 200;
				x = 300;
			}
			
			if (collide("MyEntity", x, y))
			{
				//si le vaisseau entre en colision avec l'avion

			}
		}
		
	}

}