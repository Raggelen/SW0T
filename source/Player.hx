package source;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.input.FlxKeyManager;
import AssetPaths;

/**
 * ...
 * @author Rens
 */
class Player extends FlxSprite
{
	var _up:Bool = false;
	var _down:Bool	= false;
	var _left:Bool = false;
	var _right:Bool = false;

	public var speed:Float = 200;

	var mA:Float = 0;

	override public function update(elapsed:Float):Void
	{
		movement();
		speedModifier();
		faceDirection();
		super.update(elapsed);
	}

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y); //super is basically saying go up to the chain to the parent class, in this case FlxSprite, and call the constructor, passing it the x and y arguments that were passed to us.
		playerAvatar();

	}

	public function playerAvatar()
	{
		loadGraphic(AssetPaths.player__png, true, 16, 16); //tells sprite to use player.png, its animated, and that each frame is 16x16
		drag.x = drag.y = 1600;

		//allows the sprite to be flipped based on its 'facing' value, so we only need sprites for one direction (left)
		setFacingFlip(FlxObject.LEFT, false, false); // Don't flip when facing left
		setFacingFlip(FlxObject.RIGHT, true, false); //flip when facing right

		//Each animation ends on frame 6, the neutral pose (legs together)
		animation.add("leftright", [3, 4, 3, 5], 6, false);
		animation.add("up", [6, 7, 6, 8], 6, false);
		animation.add("down", [0, 1, 0, 2], 6, false);
	}

	public function keyPress()
	{
		_up = FlxG.keys.anyPressed([UP, W]); //any pressed function allows us to ask if any keys out of a list of keys is currently being pressed
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
	}

	public function movement():Void
	{

		keyPress();

		if (_up && _down) //if up and down are pressed the player won't move
			_up = _down = false;

		if (_left && _right) //if left and right are pressed the player won't move
			_left = _right = false;

		if (_up || _down || _left || _right) //Make sure player is actually moving, '||' is called a Logical OR Operator. If any of the operands is non-zero, then the condition becomes true.
		{
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
		}
	}

	/**
	 * This part is so that moving left/right and up/down doesn't increase the speed of the player
	 */
	public function speedModifier() //calculates speedModifier mA
	{
		if (_up)
		{
			mA = -90;

			if (_left)
			{
				mA -= 45; //diagonal up-left
			}

			else if (_right)
			{
				mA += 45; ///diagonal up-right
			}
		}

		else if (_down)
		{
			mA = 90;

			if (_left)
			{
				mA += 45;//diagonal down-left
			}

			else if (_right)
			{
				mA -= 45;//diagonal down-right
			}
		}

		else if (_left)
		{
			mA = 180; //left
		}

		else if (_right)
		{
			mA = 0;//right
		}
	}

	public function faceDirection()
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

}