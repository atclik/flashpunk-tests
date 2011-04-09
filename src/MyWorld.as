package  
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input; 
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author 
	 */
	public class MyWorld extends World
	{
		public var time:Number = 0;
		private var joueur:MyEntity;
		public function MyWorld() 
		{
			var i:Number = 1;
			//while (i < 100)
			//{
				//add(new Myentity2);
				//i++;
			//}
			joueur = new MyEntity();
			add(joueur);
		}	
		
		override public function update():void
		{
			time += FP.elapsed;
			
			
			var b:Myentity2 = joueur.collide("MyEntity2", joueur.x, joueur.y) as Myentity2;
			if (b)
			{
				b.destroy();
			}
			
			if (Input.check(Key.UP))
			{
				//la barre espace est enfoncée
				joueur.y -= 5;
			}
			if (Input.check(Key.RIGHT))
			{
				//le bouton droite est efoncé
				joueur.x += 5;
			}
			if (Input.check(Key.LEFT))
			{
				//le bouton gauche est enclenché
				joueur.x -= 5;
			}
			if (Input.check(Key.DOWN))
			{
				//le bouton r "reload" est enclenché
				joueur.y += 5;
			}
			if (Input.pressed(Key.SPACE))
			{
				//bouton de tir enfoncé
				joueur.shoot.play();
				add(new Missile(joueur.x+20,joueur.y));
			}
				
			if (joueur.collide("MyEntity2", joueur.x, joueur.y))
			{
				//si le l'avion entre en colision avec le vaisseau
			
			}
			
			
			
			if (time >= 2)
			{
				add(new Myentity2(randRange(20, 620), 25));
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