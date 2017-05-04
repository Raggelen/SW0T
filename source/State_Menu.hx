package source;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author Rens
 */
class State_Menu extends FlxState
{
	private var _btnPlay:FlxButton;

	override public function create():Void
	{
		FlxG.camera.bgColor = FlxColor.BLUE;
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		add(_btnPlay);
		_btnPlay.screenCenter();
		super.create();
		trace("created a play button");
	}

	private function clickPlay(): Void
	{
		FlxG.switchState(new source.State_Game());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
