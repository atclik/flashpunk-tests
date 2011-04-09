package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input; 
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author 
	 */
	
	public class MyEntity extends Entity
	{	
		[Embed(source = 'assets/shoot.mp3')] 
		private const SHOOT:Class;
		public var shoot:Sfx = new Sfx(SHOOT);
		[Embed(source = 'assets/avion2.png')]
		private const PLAYER:Class;

		
		public function MyEntity() 
		{
			Input.define("Jump", Key.Z, Key.UP); //memes touches 1 action
			graphic = new Image(PLAYER);
			setHitbox(64, 64);
			type = "MyEntity";
			

		}
		override public function update():void
		//boucle de rafraichissement
		{
			/*
			var b:Myentity2 = collide("MyEntity2", x, y) as Myentity2;
			if (b)
			{
				b.destroy();
			}
			
			if (Input.check(Key.UP))
			{
				//la barre espace est enfoncée
				y -= 5;
			}
			if (Input.check(Key.RIGHT))
			{
				//le bouton droite est efoncé
				x += 5;
			}
			if (Input.check(Key.LEFT))
			{
				//le bouton gauche est enclenché
				x -= 5;
			}
			if (Input.check(Key.DOWN))
			{
				//le bouton r "reload" est enclenché
				y += 5;
			}
			if (Input.pressed(Key.SPACE))
			{
				//bouton de tir enfoncé
				shoot.play();
			}
				
			if (collide("MyEntity2", x, y))
			{
				//si le l'avion entre en colision avec le vaisseau
				
			}
			*/
		}
		
	}

}