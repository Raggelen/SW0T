package source;

import flash.errors.ArgumentError;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.input.FlxKeyManager;
import AssetPaths;
import haxe.macro.Expr.Var;

/**
 * ...
 * @author Rens
 */

enum MoveDirection
{
	UP;
	DOWN;
	LEFT;
	RIGHT;
}

class Player extends FlxSprite
{
	var _up:Bool = false;
	var _down:Bool	= false;
	var _left:Bool = false;
	var _right:Bool = false;
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

	//public var speed:Float = 200;

	private var moveDirection:MoveDirection;

	var mA:Float = 0;

	override public function update(elapsed:Float):Void
	{
		movement(); //Logic for movement
		MovementPool();
		//speedModifier(); //handles speed for different angles
		//faceDirection(); //sets direction for the animations
		super.update(elapsed);
	}
	
	public function MovementPool() 
	{
			if (movementPoints < 0)
			{
				movementPoints = 0;
			}
	}
	
	

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y); //super is basically saying go up to the chain to the parent class, in this case FlxSprite, and call the constructor, passing it the x and y arguments that were passed to us.
		playerAvatar();

	}

	public function playerAvatar()
	{
		/*
		loadGraphic(AssetPaths.player__png, true, 16, 16); //tells sprite to use player.png, its animated, and that each frame is 16x16
		drag.x = drag.y = 1600;
		setSize(8, 14); //change hitbox so that player can move easier through 1 block doorways
		offset.set(4, 2); //change hitbox so that player can move easier through 1 block doorways

		//allows the sprite to be flipped based on its 'facing' value, so we only need sprites for one direction (left)
		setFacingFlip(FlxObject.LEFT, false, false); // Don't flip when facing left
		setFacingFlip(FlxObject.RIGHT, true, false); //flip when facing right

		//Each animation ends on frame 6, the neutral pose (legs together)
		animation.add("leftright", [3, 4, 3, 5], 6, false);
		animation.add("up", [6, 7, 6, 8], 6, false);
		animation.add("down", [0, 1, 0, 2], 6, false);
		*/

		loadGraphic(AssetPaths.HeavySpriteSheet__png, true, 32, 32); //tells sprite to use player.png, its animated, and that each frame is 16x16
		drag.x = drag.y = 1600;
		//setSize(16, 28); //change hitbox so that player can move easier through 1 block doorways
		//offset.set(4, 2); //change hitbox so that player can move easier through 1 block doorways

		//allows the sprite to be flipped based on its 'facing' value, so we only need sprites for one direction (left)
		setFacingFlip(FlxObject.LEFT, false, false); // Don't flip when facing left
		setFacingFlip(FlxObject.RIGHT, true, false); //flip when facing right

		//Each animation ends on frame 6, the neutral pose (legs together)
		animation.add("leftright", [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 24, false);
		animation.add("up", [19,20,21,22,23,24,25,26,27,28,29,30,31,32], 24, false);
		animation.add("down", [38,39,40,41,42,43,44,45,46,47,48], 24, false);

	}
	/*
		public function keyPress()
		{
			moveDirection._up = FlxG.keys.anyPressed([UP, W]); //any pressed function allows us to ask if any keys out of a list of keys is currently being pressed
			moveDirection._down = FlxG.keys.anyPressed([DOWN, S]);
			moveDirection._left = FlxG.keys.anyPressed([LEFT, A]);
			moveDirection._right = FlxG.keys.anyPressed([RIGHT, D]);
		}
	*/
	public function movement():Void
	{

		//keyPress();
		

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

		/*
				if (_up && _down) //if up and down are pressed the player won't move
					_up = _down = false;

				if (_left && _right) //if left and right are pressed the player won't move
					_left = _right = false;

				if (_up || _down || _left || _right) //Make sure player is actually moving, '||' is called a Logical OR Operator. If any of the operands is non-zero, then the condition becomes true.
				{
					velocity.set(speed, 0);
					velocity.rotate(FlxPoint.weak(0, 0), mA);
				}

				*/
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

	/**
	 * This part is so that moving left/right and up/down doesn't increase the speed of the player
	 */

	/*
	public function speedModifier() //calculates speedModifier mA
	{
		if (_up)
		{
			mA = -90;
			//trace("up");

			if (_left)
			{
				mA -= 45; //diagonal up-left
				//trace("diagonal up-left");
			}

			else if (_right)
			{
				mA += 45; ///diagonal up-right
				//trace("diagonal up-right");
			}
		}

		else if (_down)
		{
			mA = 90;

			if (_left)
			{
				mA += 45;//diagonal down-left
				//trace("diagonal down-left");
			}

			else if (_right)
			{
				mA -= 45;//diagonal down-right
				//trace("diagonal down-right");
			}
		}

		else if (_left)
		{
			mA = 180; //left
			//trace("left");
		}

		else if (_right)
		{
			mA = 0;//right
			//trace("right");
		}
	}

	public function faceDirection() // what direction is the unit facing.
	{
		if (mA == 45)
		{
			facing = FlxObject.UP;
			trace("UP");
		}

		if (mA == -45)
		{
			facing = FlxObject.DOWN;
			trace("DOWN");
		}

		if (mA == 180)
		{
			facing = FlxObject.LEFT;
			trace("LEFT");
		}

		if (mA == 0)
		{
			facing = FlxObject.RIGHT;
			trace("RIGHT");
		}

		switch (facing)
		{
			case FlxObject.LEFT, FlxObject.RIGHT:
				animation.play("leftright");
			case FlxObject.UP:
				animation.play("up");
			case FlxObject.DOWN:
				animation.play("down");

		}
	}

	*/
}