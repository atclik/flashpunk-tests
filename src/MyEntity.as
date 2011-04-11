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
		//declarations
		[Embed(source = 'assets/avion2.png')]
		private const PLAYER:Class;
		
		
		[Embed(source = 'assets/Grenade.mp3')] 
		private const SHOOT:Class;
		
		public var shoot:Sfx = new Sfx(SHOOT);
		
		//constructeur du joueur
		public function MyEntity() 
		{
			//Input.define("Jump", Key.Z, Key.UP); //memes touches 1 action
			graphic = new Image(PLAYER);
			setHitbox(1, 1, -32, -32 );//voir doc pour centrer le collider
			type = "MyEntity";
		}
		//destructeur du joueur
		public function destroy():void 
		{
			FP.world.remove(this);
		}
		
	}

}