package;

import flixel.FlxGame;
import flixel.FlxState;
import states.State_Game;
import states.State_Menu;

import openfl.display.Sprite;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

import flixel.FlxG;
import flixel.util.FlxColor;

import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.ui.FlxButton;
import flixel.text.FlxText;



class Main extends Sprite
{
	
	

	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, State_Game)); //sets screen size to 320x180 and sets initial state

		FlxG.camera.bgColor = FlxColor.RED; // Turns screen red
		
		}

	
}