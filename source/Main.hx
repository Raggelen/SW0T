package;

import openfl.display.Sprite;

import flixel.FlxGame;
import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxColor;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

import source.State_Menu;


class Main extends Sprite
{		
	

	public function new()
	{
		super();
		addChild(new FlxGame(320, 180, State_Menu));
		
		
			FlxG.camera.bgColor = FlxColor.RED;

	}

	
}
