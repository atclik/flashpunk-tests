package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author 
	 */
	public class Myentity2 extends Entity
	{	
		[Embed(source = 'assets/bombe.png')] 
		private const BOMBE:Class;
		//constructeur de bombe
		public function Myentity2(_x:int, _y:int) 
		{
			graphic = new Image(BOMBE);
			setHitbox(45, 45);
			type = "MyEntity2";
			//on recupere les valeurs placées en parametre lors de l'appel celles de la "fonction math random"----> x
																						//"-20" ------------------> y
			y = _y;
			x = _x;
		}
		//destructeur de bombe
		public function destroy():void 
		{
			
			FP.world.remove(this);
		}
		
		override public function update():void
		{	//On fait descendre les bombes a l'ecran
			y += 1;
			//si les bombes sortent de l'ecran par le bas on les detruit
			if (y > FP.height )
			{
				trace("objet suprimé");
				destroy();
			}
		}
		
	}

}