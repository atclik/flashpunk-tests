package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input; 
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap; 
	/**
	 * ...
	 * @author 
	 */
	
	public class MyEntity extends Entity
	{	
		[Embed(source = 'assets/avion2.png')]
		private const PLAYER:Class;
		
		[Embed(source = 'assets/explosprite.png')] 
		private const EXPLO:Class;
		
		public var explo:Spritemap = new Spritemap(EXPLO, 50, 50);
		
		[Embed(source = 'assets/Grenade.mp3')] 
		private const SHOOT:Class;
		
		public var shoot:Sfx = new Sfx(SHOOT);
		
		public function MyEntity() 
		{
			Input.define("Jump", Key.Z, Key.UP); //memes touches 1 action
			graphic = new Image(PLAYER);
			setHitbox(64, 64);//voir doc pour centrer le collider
			type = "MyEntity";
			
			//explo.add("explo1", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 10, true); 
			//graphic = explo;
			//type = "explo";
		}
		
		public function destroy():void 
		{
			FP.world.remove(this);
		}
		override public function update():void
		//boucle de rafraichissement
		{
			if (collide("MyEntity2", x, y))
			{
				trace("PERDU");
				//explo.play("explo1");
				destroy();
				
			}
		}
		
	}

}