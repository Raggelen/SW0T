package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import Spelers;

/**
 * ...
 * @author Ramon Boelens
 */

class Unit extends Sprite
{
	public var type : String;
	public var alive : Bool;
	public var position : Int;
	public var imagePath : String;

	public function new(type:String, alive:Bool, position:Int, imagePath:String) 
	{
		super();
		
		/*
		trace(type);
		trace(alive);
		trace(position);
		trace(imagePath);
		*/
		
		var imageData : BitmapData = Assets.getBitmapData(imagePath);
		var image : Bitmap = new Bitmap(imageData);
		addChild(image);
	}
}