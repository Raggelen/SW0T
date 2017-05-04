package source;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class State_Game extends FlxState
{
	override public function create():Void
	{
		FlxG.camera.bgColor = FlxColor.GRAY;
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
