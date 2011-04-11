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
		//declarations en tout genres
		private var i:Number = 2;
		public var time:Number = 0;
		private var joueur:MyEntity;
		private var ciel:Ciel;
		private var satel:satelite;
		private var explo:Explosion;
		private var score:Number=0;
 		
		[Embed(source = 'assets/stevenseagal.mp3')] 
		private const START:Class;
		
		public var depart:Sfx = new Sfx(START);
		
		[Embed(source = 'assets/acdc.mp3')] 
		private const AMBIENCE:Class;
		
		public var ambience:Sfx = new Sfx(AMBIENCE);
		
		[Embed(source = 'assets/acdc2.mp3')] 
		private const AMBIENCE2:Class;
		
		public var ambience2:Sfx = new Sfx(AMBIENCE2);		
		
		[Embed(source = 'assets/invasionusa.mp3')] 
		private const PERDU:Class;
		
		public var replique:Sfx = new Sfx(PERDU);
	    //constructeur
		public function MyWorld() 
		{	//scene de depart
			var i:Number = 1;
			//ajout du fond (decors)
			ciel = new Ciel();
			add(ciel);
			//ajout du satellite dans le decors
			satel = new satelite();
			add(satel); 
			//ajout du joueur dans le decors
			joueur = new MyEntity();
			add(joueur);
			//positionnement du joueur dans la fenetre
			joueur.x = 300;
			joueur.y = 300;
			//commentaire d'introduction
			depart.play();
			
		}	
		//boucle de rafraichissement
		override public function update():void
		{
			time += FP.elapsed;
			//gestion de l'ambience sonore tant que l'intro n'est pas finie on ne lance pas la musique et ainsi desuite
			if (depart.playing)
			{
					ambience.play();
					if (ambience.playing)
					{
						ambience2.play();
						if (ambience2.playing)
						{
							//autre musique a declarer
						}
					}
			}
			//gestion des touches du clavier
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
			//gestion de la touche des roquettes devient active a partir du niveau 0.5
			if (i <= 0.5)
			{	//prevenir le joueur qu'il a droit de tirer des roquettes (image)
				if (Input.pressed(Key.SPACE))
				{
					//bouton de tir enfoncé
					joueur.shoot.play();
					add(new Missile(joueur.x+20,joueur.y));
				}
			}
			if (joueur.collide("MyEntity2", joueur.x, joueur.y))
			{
				//si le l'avion entre en colision avec une bombe il explose s'en suit une replique de CHUCK
				trace("PERDU");
				
				ambience2.stop();
				ambience.stop();
				depart.stop();
				add(new Explosion(joueur.x, joueur.y));
				replique.play();
				joueur.destroy();
				//if (time <= 20)
				//{
					//explo.destroy();
				//}	
			}
			
			
			//systeme de generation des bombes "les niveaux augmentent tout seul et se stabilise a un niveau max"
			if (time >= i)
			{	//ajout de bombes le long de l'axe des X avec y a -20 (juste au dessus du haut de l'ecran --> "0")
				add(new Myentity2(randRange(20, 620), -20));
				time = 0;
				//le score se genere ici (plus on vas loin plus on score)
				score += 1;
				trace(score);
				//ici on ne laisse pas la difficulter monter trop haut on la limite a 0.3
				if (i >= 0.3)
				{
					//ici la difficultée augmente en diminuant l'intervale de temps entre deux bombes generées
					i -= 0.01;
					trace(i);
				}
				
			}
			super.update();
			
		}
		//fonction qui genere aleatoirement les bombes 
		public function randRange(min:Number, max:Number):Number 
		{
			//super fonction de math a la quelle je ne comprends rien
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
	}

}