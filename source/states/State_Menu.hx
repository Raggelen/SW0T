package states;
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
		FlxG.camera.bgColor = FlxColor.BLUE; // turns screen blue
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay); //creates a button at (0,0) that says play, and calls function 'clickPlay'
		add(_btnPlay);
		_btnPlay.screenCenter(); // places button in the centre of the screen

		FlxG.camera.fade(FlxColor.BLACK, .33, true); //fade out while switching states

		super.create();

	}

	private function clickPlay(): Void
	{

		FlxG.camera.fade(FlxColor.BLACK,.33, false, function()
		{
			FlxG.switchState(new State_Game());
		});

		//FlxG.switchState(new states.State_Game()); //switches state to 'State_Game' if function is called
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}