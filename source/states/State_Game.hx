package states;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import source.Player;

class State_Game extends FlxState
{
	private var _player:Player;
	
	override public function create():Void
	{
		FlxG.camera.bgColor = FlxColor.GRAY; // turns screen gray
		
		FlxG.camera.fade(FlxColor.BLACK, .33, true); //fade out while switching states
		
		super.create();
		
		createPlayer();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	
	function  createPlayer()
	{
		_player = new Player(20, 20);
		add(_player);
	}
	
}
