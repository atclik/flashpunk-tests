package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP; 
	import net.flashpunk.graphics.Spritemap; 
	
	/**
	 * ...
	 * @author 
	 */
	public class Missile extends Entity
	{
		[Embed(source = 'assets/missile-sprite.png')] 
		private const MISSILE:Class;
		public var missile:Spritemap = new Spritemap(MISSILE, 23, 97);
		
		public function Missile(_x:int,_y:int)
		{
			missile.add("fire", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 20, true); 
			graphic = missile;
			setHitbox(23, 90);
			type = "missile";
			x = _x;
			y = _y;
			
		}
		public function destroy():void 
		{
				
			trace("missile detruit");
			FP.world.remove(this);
		}
		override public function update():void
		{
			missile.play("fire");
			y -= 5;
			var b:Myentity2 = collide("MyEntity2", x, y) as Myentity2;
			if (collide("MyEntity2", x, y))
			{
				destroy();
				b.destroy();
			}
			//detruit le missile qui sort de l'ecran
			if (y < 0)
			{
				destroy();
			}
		}
		
	}

}