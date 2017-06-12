package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

import flash.errors.ArgumentError;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.input.FlxKeyManager;
import AssetPaths;
import haxe.macro.Expr.Var;

import flixel.FlxSprite;

import Spelers;

/**
 * ...
 * @author Ramon Boelens
 */

enum MoveDirection
{
	UP;
	DOWN;
	LEFT;
	RIGHT;
}
 
class Unit extends FlxSprite
{
	public var type : String;
	//public var alive : Bool;
	public var position : Int;
	public var imagePath : String;
	
	public var movementPoints:Int = 7;
	
	/**
	 * The size of the tiles in the tilemap
	 */
	private static inline var TILE_SIZE:Int = 32;
	
	/**
	 * how any pixels to move each frame.
	 */
	private static inline var MOVEMENT_SPEED:Int = 4;

	/**
	 * Flag used to chekc if unit is moving
	 */
	public var moveToNextTile:Bool;
	private var moveDirection:MoveDirection;

	override public function update(elapsed:Float):Void
	{
		movement(); //Logic for movement
		MovementPool();
		//speedModifier(); //handles speed for different angles
		//faceDirection(); //sets direction for the animations
		super.update(elapsed);
	}
	
	public function new(type:String, position:Int, imagePath:String) 
	{
		super();
		loadGraphic(imagePath, true, 32, 32);
		
	}
	
	public function MovementPool() 
	{
		if (movementPoints < 0)
		{
			movementPoints = 0;
		}
	}
	
	public function movement():Void
	{
		if ((moveToNextTile) && (movementPoints>0))
		{
			switch (moveDirection)
			{
				case UP:
					y -= MOVEMENT_SPEED;
					

				case DOWN:
					y += MOVEMENT_SPEED;
					

				case LEFT:
					x -= MOVEMENT_SPEED;
					

				case RIGHT:
					x += MOVEMENT_SPEED;
					
			
			}
		}

		if ((x % TILE_SIZE == 0) && (y%TILE_SIZE ==0))
		{
			moveToNextTile = false;
			
		}

		if (FlxG.keys.anyPressed([DOWN,S]))
		{
			trace("down");
			moveTo(MoveDirection.DOWN);
		}
		else if (FlxG.keys.anyPressed([UP,W]))
		{
			trace("UP");
			moveTo(MoveDirection.UP);
		}
		else if (FlxG.keys.anyPressed([LEFT,A]))
		{
			trace("LEFT");
			moveTo(MoveDirection.LEFT);
		}
		else if (FlxG.keys.anyPressed([RIGHT,D]))
		{
			trace("RIGHT");
			moveTo(MoveDirection.RIGHT);
		}		
	}
	
	public function moveTo(Direction:MoveDirection):Void
	{
		if (!moveToNextTile)
		{
			moveDirection = Direction;
			moveToNextTile = true;
			
			movementPoints--;
			if (movementPoints < 0)
			{
				movementPoints == 0;
			}
			
			trace(movementPoints);
		}
	}
}