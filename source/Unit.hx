package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import states.State_Game;

import flash.errors.ArgumentError;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.input.FlxKeyManager;
import AssetPaths;
import haxe.macro.Expr.Var;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.input.FlxInput;
import flixel.tweens.FlxTween;
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
	public var imagePath : String;
	public var selected : Int = 0; //0 is not selected | 1 is selected
	public var owner : Int = 0;
	public var typeNumber : Int;
	public var unitFacing : String = "up";
	
	var speed : Float;

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	public function new(type:String, imagePath:String, Unit_Owner : Int) 
	{
		super();
		loadGraphic(imagePath, true, 32, 32);	
		owner = Unit_Owner;
		
		loadAnimations(type);
	}
	
	function loadAnimations(type : String)
	{
		if (type == "light")
		{
			animation.add("up", [0, 1, 2, 3, 4, 5, 6], 12, false);
			animation.add("left", [37, 38, 39, 40, 41, 42, 43], 12, false);
			animation.add("down", [74, 75, 76, 77, 78, 79, 80], 12, false);
			animation.add("right", [111, 112, 113, 114, 115, 116, 117], 12, false);
			
			speed = 0.5;
		}
		
		else if (type == "medium")
		{
			animation.add("up", [0, 1, 2, 3, 4, 5, 6], 12, false);
			animation.add("left", [34, 35, 36, 37, 38, 39, 40], 12, false);
			animation.add("down", [68, 69, 70, 71, 72, 73, 74], 12, false);
			animation.add("right", [102, 103, 104, 105, 106, 107, 108], 12, false);
			
			speed = 0.5;
		}
		
		else if (type == "heavy")
		{
			animation.add("up", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 20, false);
			animation.add("left", [43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58], 20, false);
			animation.add("down", [86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101], 20, false);
			animation.add("right", [129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144], 20, false);
			
			speed = 0.8;
		}
	}
	
	public function onUp():Void 
	{
		if (this.selected == 1 && State_Game.movementPoints > 0)
		{		
			if (this.type == "light" || this.type == "medium")
			{
				FlxTween.tween(this, {x: this.x, y: this.y - 32}, speed);
			}
			else if (this.type == "heavy")
			{
				FlxTween.tween(this, {x: this.x, y: this.y - 32}, speed);
			}
			animation.play("up");
			this.facing = FlxObject.UP;
			State_Game.movementPoints --;
			
			if (this.facing == FlxObject.UP)
			{
				trace("Up");
			}
		}
		else
		{
			trace("None selected or no movement points");
		}
		
		trace(State_Game.movementPoints);
	}
	
	public function onDown():Void
	{
		if (this.selected == 1 && State_Game.movementPoints > 0)
		{
			if (this.type == "light" || this.type == "medium")
			{
				FlxTween.tween(this, {x: this.x, y: this.y + 32}, speed);
			}
			else if (this.type == "heavy")
			{
				FlxTween.tween(this, {x: this.x, y: this.y + 32}, speed);
			}
			animation.play("down");
			this.facing = FlxObject.DOWN;
			State_Game.movementPoints --;
			
			if (this.facing == FlxObject.DOWN)
			{
				trace("Down");
			}
		}
		else
		{
			trace("None selected or no movement points");
		}
		
		trace(State_Game.movementPoints);
	}
	
	public function onLeft():Void 
	{
		if (this.selected == 1 && State_Game.movementPoints > 0)
		{
			if (this.type == "light" || this.type == "medium")
			{
				FlxTween.tween(this, {x: this.x - 32, y: this.y}, speed);
			}
			else if (this.type == "heavy")
			{
				FlxTween.tween(this, {x: this.x - 32, y: this.y}, speed);
			}
			animation.play("left");
			this.facing = FlxObject.LEFT;
			State_Game.movementPoints --;
			
			if (this.facing == FlxObject.LEFT)
			{
				trace("Left");
			}
		}
		else
		{
			trace("None selected or no movement points");
		}
		
		trace(State_Game.movementPoints);
	}
	
	public function onRight():Void
	{
		if (this.selected == 1 && State_Game.movementPoints > 0)
		{
			if (this.type == "light" || this.type == "medium")
			{
				FlxTween.tween(this, {x: this.x + 32, y: this.y}, speed);
			}
			else if (this.type == "heavy")
			{
				FlxTween.tween(this, {x: this.x + 32, y: this.y}, speed);
			}
			animation.play("right");
			this.facing = FlxObject.RIGHT;
			State_Game.movementPoints --;
			
			if (this.facing == FlxObject.RIGHT)
			{
				trace("Right");
			}
		}
		else
		{
			trace("None selected or no movement points");
		}
		
		trace(State_Game.movementPoints);
	}
	
	public function returnTypeNumber() : Int
	{
		return typeNumber;
	}
	
	public function return_FacingDirection() : Int
	{
		return this.facing;
	}
	
	public function returnPosX() : Float
	{
		return this.x;
	}
	
	public function returnPosY() : Float
	{
		return this.y;
	}
}