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
	public class MyWorld extends World
	{
		public var time:Number = 0;
		private var joueur:MyEntity;
		private var ciel:Ciel;
		private var satel:satelite;
 		
		[Embed(source = 'assets/stevenseagal.mp3')] 
		private const START:Class;
		
		[Embed(source = 'assets/invasionusa.mp3')] 
		private const PERDU:Class;
		
		public var depart:Sfx = new Sfx(START);
		
		public var replique:Sfx = new Sfx(PERDU);
	    
		public function MyWorld() 
		{
			var i:Number = 1;
			ciel = new Ciel();
			add(ciel);
			satel = new satelite();
			add(satel); 
			joueur = new MyEntity();
			add(joueur);
			joueur.x = 300;
			joueur.y = 300;
			depart.play();
		}	
		
		override public function update():void
		{
			time += FP.elapsed;
			
			//var b:Myentity2 = joueur.collide("MyEntity2", joueur.x, joueur.y) as Myentity2;
			//if (b)
			//{
				//trace("PERDU");
				//add(explo);
				//explo.x = joueur.x;
				//explo.y = joueur.y;
				//explo.update();
				//b.destroy();
			//}
			
			if (Input.check(Key.UP))
			{
				//la barre espace est enfoncée
				joueur.y -= 5;
				if (joueur.y < 0)
				{
					joueur.y += 5;
				}
			}
			if (Input.check(Key.RIGHT))
			{
				//le bouton droite est efoncé
				joueur.x += 5;
				if (joueur.x > 578)
				{
					joueur.x -= 5;
				}
			}
			if (Input.check(Key.LEFT))
			{
				//le bouton gauche est enclenché
				joueur.x -= 5;
				if (joueur.x < 0)
				{
					joueur.x += 5;
				}
			}
			if (Input.check(Key.DOWN))
			{
				joueur.y += 5;
				if (joueur.y > 420)
				{
					joueur.y -= 5;
				}
			}
			if (Input.pressed(Key.SPACE))
			{
				//bouton de tir enfoncé
				joueur.shoot.play();
				add(new Missile(joueur.x+20,joueur.y));
			}

			if (joueur.collide("MyEntity2", joueur.x, joueur.y))
			{
				//si le l'avion entre en colision avec une bombe
				add(new Explosion(joueur.x, joueur.y));
				depart.stop();
				replique.play();
				
			}
			
			
			
			if (time >= 3)
			{
				add(new Myentity2(randRange(20, 620), -20));
				time = 0;
			}
			super.update();
			
		}
		public function randRange(min:Number, max:Number):Number 
		{
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
	}

}