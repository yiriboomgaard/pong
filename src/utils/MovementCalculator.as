package utils 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Yiri Boomgaard
	 */
	public class MovementCalculator 
	{
		
		public static function calculateMovement(speed:Number, angle:Number):Point 
		{
			
			var radians:Number = angle * Math.PI/180;
			var xmove:Number = Math.cos(radians)*speed;
			var ymove:Number = Math.sin(radians)*speed;
			return new Point(xmove, ymove);
			
		}
		
	}

}