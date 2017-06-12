package;
import flash.display.Sprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Rens
 */
class Camera extends FlxSprite
{
	var _up:Bool = false;
	var _down:Bool	= false;
	var _left:Bool = false;
	var _right:Bool = false;

	public var speed:Float = 200;

	var mA:Float = 0;

	override public function update(elapsed:Float):Void
	{
		movement(); //Logic for movement
		speedModifier(); //handles speed for different angles

		super.update(elapsed);

		if (FlxG.mouse.wheel != 0)
		{
			// Mouse wheel logic goes here, for example zooming in / out:
			FlxG.camera.zoom += (FlxG.mouse.wheel / 10);

		}
		
		camera.x = camera.x + speed;
		camera.y = camera.y + speed;

	}

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super();
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
}