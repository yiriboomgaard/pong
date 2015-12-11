package screens 
{
	import flash.events.Event;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author Yiri Boomgaard
	 */
	public class WinScreen extends Screen 
	{
		private var title:TextField;
		private var timer:Timer;
		public static const RESET:String = "reset";
		public function WinScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
						
			title = new TextField();
			title.embedFonts = true;
			title.text = "you win";
			title.autoSize = TextFieldAutoSize.CENTER;			
			title.setTextFormat(textFormat);		
			
			title.x = stage.stageWidth / 2 - title.textWidth /2;
			title.y = stage.stageHeight / 2 - title.textHeight /2;
			
			title.mouseEnabled = false;
			
			addChild(title);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, reset);
			
			timer = new Timer(5000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
			timer.start();
		}
		
		private function onComplete(e:TimerEvent):void 
		{
			reset();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
		}
		private function reset(e:KeyboardEvent=null):void 
		{
			if (e == null)
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, reset);
				dispatchEvent(new Event(RESET));
				return;
			}
			if (e.keyCode == 32) {				
				stage.removeEventListener(KeyboardEvent.KEY_UP, reset);				
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
				timer.stop();
				dispatchEvent(new Event(RESET));
				
			}
		
		}
		
	}

}