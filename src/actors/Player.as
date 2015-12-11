//link: https://github.com/yiriboomgaard/pong.git
package actors 
{
	import utils.Controller;	
	import flash.events.Event;
	/**
	 * ...
	 * @author Yiri Boomgaard
	 */
	public class Player extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		private var _maxSpeed:Number;
		
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);		
		}		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			controller = new Controller(stage);
			this.addEventListener(Event.ENTER_FRAME, loop);			
		}
		private function loop(e:Event):void 
		{
			if (controller.up)
			{
				speed = -10;
			}
			else if(controller.down)
			{
				speed = 10;
			}else
			{
				if (speed > 0) speed--;
				if (speed < 0) speed++;
				
			}
			if (controller.fire)
			{
				
				
			}
			this.y += speed;
		}
		
		public function set maxSpeed(s:Number):void
  {
   _maxSpeed = s;
   if(_maxSpeed > 10)
   {
    _maxSpeed = 10;
    trace("maxspeed cannot be more than 10!")
   }
  }
  
  public function get maxSpeed():Number
  {
   return _maxSpeed;
  }
	}

}