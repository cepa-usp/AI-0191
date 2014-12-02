package  
{
	import BaseAssets.BaseMain;
	import cepa.LO.tools.Tool_Regua;
	import com.adobe.serialization.json.JSON;
	import com.eclecticdesignstudio.motion.Actuate;
	import com.eclecticdesignstudio.motion.easing.Cubic;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import pipwerks.SCORM;
	/**
	 * ...
	 * @author Alexandre
	 */
	public class Main extends BaseMain
	{
		
		private var debugMode:Boolean = false;
		private var regua:Tool_Regua;
		private var frutas:Array = new Array();
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			initVariables();
		}
		
		private function initVariables():void
		{	
			frutas.push(fruta0);
			frutas.push(fruta1);
			frutas.push(fruta2);
			frutas.push(fruta3);
			frutas.push(fruta4);
			regua = new Tool_Regua();
			stage.addChild(regua);
			regua.x = 50;
			regua.y = 400;
			
			randomizaFrutas();
			
			for (var i:int = 0; i < frutas.length; i++){
				frutas[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			}
			
			resetBtn.addEventListener(MouseEvent.CLICK, reset);
		}
		
		private var dragger = null;
		function startDragging(e:MouseEvent) {
			dragger = e.target;
			dragger.startDrag();
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
		}
		 
		function stopDragging(e:MouseEvent) {
			dragger.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragging);
			dragger = null;
		}
		
		private function randomizaFrutas():void{
			for (var i:int = 0; i < frutas.length; i++){
				var posX:Number = Math.random() * 600 + 50;
				var posY:Number = Math.random() * 400 + 50;

				frutas[i].x = posX;
				frutas[i].y = posY;
			}
		}
		
		override public function reset(e:MouseEvent = null):void
		{
			randomizaFrutas();
		}		

	}

}