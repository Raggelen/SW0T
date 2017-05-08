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

import AssetPaths;
/**
* ...
* @author Rens
*/
class State_Menu extends FlxState
{
	private var _btnPlay:FlxButton;

	private var _txtTitle:FlxText;
	private var _btnOptions:FlxButton;

	override public function create():Void
	{
		FlxG.camera.bgColor = FlxColor.BLUE; // turns screen blue

		createPlayButton();
		createTitleText();
		createOptionsButton();
		createBanner();
	//menuMusic();
		
		

		FlxG.camera.fade(FlxColor.BLACK, .33, true); //fade out while switching states

		super.create();

	}

	public function createBanner()
	{
		var bannerUnit = new FlxSprite();
		bannerUnit.loadGraphic(AssetPaths.bannerUnit__png);
		add(bannerUnit);
		bannerUnit.x = (FlxG.width / 2) - (bannerUnit.width /2);
		bannerUnit.y = (FlxG.height/2) - bannerUnit.height + 150;
	}

	public function createPlayButton()
	{
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay); //creates a button at (0,0) that says play, and calls function 'clickPlay'
		_btnPlay.x = (FlxG.width / 2) - _btnPlay.width - 10;
		_btnPlay.y = FlxG.height - _btnPlay.height - 50;
		add(_btnPlay);
	}

	public function createTitleText()
	{
		_txtTitle = new FlxText(20, 0, 0, "S.W.0.T.", 22);
		_txtTitle.alignment = CENTER;
		_txtTitle.screenCenter(X);
		add(_txtTitle);
		_txtTitle.y = 20;
	}

	public function createOptionsButton()
	{
		_btnOptions = new FlxButton(0, 0, "Options", clickOptions);
		_btnOptions.x = (FlxG.width / 2) + 10;
		_btnOptions.y = FlxG.height - _btnOptions.height - 50;
		add(_btnOptions);
	}

	function clickOptions():Void
	{
		FlxG.switchState( new State_Menu_Options());
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

	/*
	public function menuMusic()
	{
		if (FlxG.sound.music == null) //Don't restart the music if it's already playing
		{
			FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__mp3, 1, true);
		}
	}
	*/
}