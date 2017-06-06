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

	private var _testlevel:FlxButton;

	override public function create():Void
	{
		FlxG.camera.bgColor = FlxColor.BLUE; // turns screen blue

		FlxG.camera.fade(FlxColor.BLACK, .5, true); //fade out while switching states

		createTestLevel();
		_bannerTestLevel(); 
		
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
		//_testlevel.x = (FlxG.width / 2) - _testlevel.width - 10;
		//_testlevel.y = FlxG.height - _testlevel.height - 50;
		
		
		
		
		add(_testlevel);
	}

	public function _bannerTestLevel()
	{
		var testLevelimage = new FlxSprite();
		testLevelimage.loadGraphic(AssetPaths.Foresttestlevelimage__png);
		add(testLevelimage);
		//testLevelimage.x = (FlxG.width / 2) - (testLevelimage.width /2);
		//testLevelimage.y = (FlxG.height / 2) - testLevelimage.height + 150;
		testLevelimage.scale.set(0.8,0.8); 

	}

}

