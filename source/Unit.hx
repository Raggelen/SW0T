package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import flixel.FlxSprite;

import Spelers;

/**
 * ...
 * @author Ramon Boelens
 */

class Unit extends FlxSprite
{
	public var type : String;
	//public var alive : Bool;
	public var position : Int;
	public var imagePath : String;

	public function new(type:String, position:Int, imagePath:String) 
	{
		super();
		
		var imageData : BitmapData = Assets.getBitmapData(imagePath);
		var image : Bitmap = new Bitmap(imageData);
		loadGraphic(imagePath, false, 16, 16);
	}
}