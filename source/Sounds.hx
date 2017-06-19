package;
import flixel.FlxSprite;
import flixel.addons.plugin.taskManager.FlxTask;
import flixel.system.FlxSound;
import openfl.Lib;
import flixel.FlxBasic;
import flixel.FlxG;
import AssetPaths;
/**
 * ...
 * @author Martijn
 */
class Sounds  extends FlxSprite
{
	private var sndInpos:FlxSound;
	private var sndTakingshot:FlxSound;
	private var sndshotLight:FlxSound;
	private var sndshotMedium:FlxSound;
	private var sndshotHeavy:FlxSound;
	private var sndEnemydown:FlxSound;

	public function new() 
	{
		super();
	}
	
	public function Inpos()
	{
	  sndInpos = FlxG.sound.load(AssetPaths.Radio_in_pos__ogg);
	  sndInpos.play(false,0.1);
	}
	
	public function takingShotLight()
	{
	
		sndshotLight = FlxG.sound.load(AssetPaths.LightGun__ogg);
	
		sndshotLight.play();
	}
	public function takingShotMedium()
	{
	
		sndshotMedium = FlxG.sound.load(AssetPaths.Mediumgun__ogg);
		
		sndshotMedium.play();
	}
	public function takingShotHeavy()
	{

		sndshotHeavy = FlxG.sound.load(AssetPaths.heavygun__ogg);
		
		sndshotHeavy.play();
	}
	public function enemyDown()
	{
		sndEnemydown = FlxG.sound.load(AssetPaths.Radio_Enemy_down__ogg);
		sndEnemydown.play();
		
	}
}