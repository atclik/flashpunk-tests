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
	{	//declarations
		[Embed(source = 'assets/missile-sprite.png')] 
		private const MISSILE:Class;
		//ici on decoupe l'image pour en faire une animation (ici des portions de 23.5 sur 97)
		public var missile:Spritemap = new Spritemap(MISSILE, 23.5, 97);
		
		//constructeur de l'animation sprite "missile"
		public function Missile(_x:int,_y:int)
		{
			//on ajoute le missile a la scene en lui donnant le nombre d'image en parametre
			missile.add("fire", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 20, true); 
			graphic = missile;
			//ici on genere une zone de collision dans l'objet (notre missile) de 23 par 90
			setHitbox(23, 90);
			type = "missile";
			//les parametres x et y sont en fait la position du centre du "joueur" 
			x = _x;
			y = _y;
			
		}
		//ici on a le destructeur des missiles
		public function destroy():void 
		{
				
			trace("missile detruit");
			FP.world.remove(this);
		}
		//boucle de rafraichissement
		override public function update():void
		{
			//on lance l'animation
			missile.play("fire");
			//et pour le moment on lance les missiles 5 fois plus vite que les bombes
			y -= 5;
			//la condition suivante determine si un missile a toucher une bombe
			var b:Myentity2 = collide("MyEntity2", x, y) as Myentity2;
			if (collide("MyEntity2", x, y))
			{	//il est alors detruit
				destroy();
				b.destroy();
			}
			//detruit le missile qui sort de l'ecran par le haut
			if (y < 0)
			{
				destroy();
			}
		}
		
	}

}