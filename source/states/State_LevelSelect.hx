package states;
import flash.display.Sprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import haxe.macro.Expr.Var;

/**
 * ...
 * @author Rens
 */
class State_LevelSelect extends FlxState
{

	public var _testlevel:FlxButton;
	public var testLevelimage = new FlxSprite();

	override public function create():Void
	{
		FlxG.camera.bgColor = FlxColor.BLUE; // turns screen blue

		FlxG.camera.fade(FlxColor.BLACK, .5, true); //fade out while switching states

		
		_bannerTestLevel();
createTestLevel();
		super.create();

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function clickTestLevel(): Void
	{

		FlxG.camera.fade(FlxColor.BLACK,.33, false, function()
		{
			FlxG.switchState(new State_Game());
		});

		//FlxG.switchState(new states.State_Game()); //switches state to 'State_Game' if function is called
	}

	public function createTestLevel()
	{
		_testlevel = new FlxButton(0, 0, "Test level", clickTestLevel); //creates a button at (0,0) that says play, and calls function 'clickPlay'
		_testlevel.x = (FlxG.width / 2) - _testlevel.width - 10;
		_testlevel.y = FlxG.height - _testlevel.height - 50;
		
		add(_testlevel);
		//_testlevel.x = testLevelimage.x;
		//_testlevel.y = testLevelimage.y - 50;

	}

	public function _bannerTestLevel()
	{
		testLevelimage = new FlxSprite();

		testLevelimage.loadGraphic(AssetPaths.Foresttestlevelimage__png);

		testLevelimage.loadGraphic(AssetPaths.Foresttestlevel2image__png);

		add(testLevelimage);
		testLevelimage.x = (FlxG.width - testLevelimage.width) / 2;
		testLevelimage.y = (FlxG.height - testLevelimage.height) / 2;
		testLevelimage.scale.set(0.5,0.5);

	}

}

