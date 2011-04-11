package  
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input; 
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author 
	 */
	public class satelite extends Entity
	{
		[Embed(source = 'assets/vaisseau.png')]
		private const DECOR:Class;
		public function satelite() 
		{
			graphic = new Image(DECOR);
		}
		
	}

}