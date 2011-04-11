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
	public class Explosion extends Entity
	{
		[Embed(source = 'assets/explosprite.png')] 
		private const EXPLO:Class;
		public var reset:Boolean = true;
		
		public var explo:Spritemap = new Spritemap(EXPLO, 65, 65);
		
		public function Explosion(_x:int, _y:int) 
		{   x = 0;
			y = 0;
			explo.add("explo1", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 10, true); 
			graphic = explo;
			type = "explo";
			x = _x;
			y = _y;
			explo.play("explo1");
		}
		public function destroy():void 
		{
				
			trace("explosion finie");
			FP.world.remove(this);
		}
		public function afficheExplo():void
		{
			//explo.play("explo1");
			//trace("EXPLOSIONNNN BOUM");
		}
		override public function update():void
		{
			//explo.play("explo1");
			y += 2;
		}
		
	}

}