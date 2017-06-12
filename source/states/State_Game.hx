package states;

import flash.events.GameInputEvent;
import flixel.FlxSprite;
import openfl.Lib;
import openfl.events.Event;
import openfl.events.MouseEvent;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import source.Player;
import flixel.math.FlxPoint;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.input.FlxInput;
import Spelers;

class State_Game extends FlxState

{
	private var _player:Player;

	var player1_light : Unit;
	var player1_medium : Unit;
	var player1_heavy : Unit;

	var player2_light : Unit;
	var player2_medium : Unit;
	var player2_heavy : Unit;

	var player3_light : Unit;
	var player3_medium : Unit;
	var player3_heavy : Unit;

	var player4_light : Unit;
	var player4_medium : Unit;
	var player4_heavy : Unit;

	public var unit : Unit;
	public var players : Array<Spelers> = new Array();

	public var _map:FlxOgmoLoader;
	public var _mWalls:FlxTilemap;
	private var _movmentPoolCount:FlxText;

	public static var instance(default, null) : State_Game = new State_Game();
	
	override public function create():Void

	{
		FlxG.camera.bgColor = FlxColor.GRAY; // turns screen gray

		FlxG.camera.fade(FlxColor.BLACK, .5, true); //fade out while switching states

		loadLevel1();
		createPlayers();

		//FlxG.camera.follow(_player, NO_DEAD_ZONE, 1); //follow the player using the topdown style with a lerp of 1 (camera smoothness)

		FlxG.camera.zoom = 1 ; //camera zoom, duh

		//movementPoolText();

		super.create();

	}
/*
	public function movementPoolText()
	{

		_movmentPoolCount = new FlxText(0, 0, 0, Std.string(_player.movementPoints), 30);
		add(_movmentPoolCount);
		trace("make movement pool text");
	}

	function movementPoolUpdate()
	{
		_movmentPoolCount.text = Std.string(_player.movementPoints);
		_movmentPoolCount.x = _player.x + 20;
		_movmentPoolCount.y = _player.y + 20;
	}
*/
	override public function update(elapsed:Float):Void

	{

		FlxG.collide(_player, _mWalls);
		//FlxG.camera.shake(0.01, 0.2); //camera shake, for when a unit dies?

		if (FlxG.mouse.wheel != 0)
		{
			// Mouse wheel logic goes here, for example zooming in / out:
			FlxG.camera.zoom += (FlxG.mouse.wheel / 10);
		}

		//checkCollison();
		//movementPoolUpdate();
		super.update(elapsed);
	}
	/*
		public function checkCollison()
		{
			if (FlxG.collide(_player,_mWalls)
			{
				_player.moveToNextTile = false;
			}
		}
	*/
	function  createPlayers()
	{
		for (i in 0 ... 4)
		{
			var player : Spelers = new Spelers();
			player.playerName = "Player " + i;
			players.push(player);
		}

		for (unit in players[0].units)
		{
			if (unit.type == "light")
			{
				player1_light = players[0].units[0];
				add(player1_light);
			}
			else if (unit.type == "medium")
			{
				player1_medium = players[0].units[1];
				add(player1_medium);
			}
			else if (unit.type == "heavy")
			{
				player1_heavy = players[0].units[2];
				add(player1_heavy);
			}
		}

		for (unit in players[1].units)
		{
			if (unit.type == "light")
			{
				player2_light = players[1].units[0];
				add(player2_light);				
			}
			else if (unit.type == "medium")
			{
				player2_medium = players[1].units[1];
				add(player2_medium);				
			}
			else if (unit.type == "heavy")
			{
				player2_heavy = players[1].units[2];
				add(player2_heavy);				
			}
		}

		for (unit in players[2].units)
		{
			if (unit.type == "light")
			{
				player3_light = players[2].units[0];
				add(player3_light);
			}
			else if (unit.type == "medium")
			{
				player3_medium = players[2].units[1];
				add(player3_medium);
			}
			else if (unit.type == "heavy")
			{
				player3_heavy = players[2].units[2];
				add(player3_heavy);
			}
		}

		for (unit in players[3].units)
		{
			if (unit.type == "light")
			{
				player4_light = players[3].units[0];
				add(player4_light);
			}
			else if (unit.type == "medium")
			{
				player4_medium = players[3].units[1];
				add(player4_medium);
			}
			else if (unit.type == "heavy")
			{
				player4_heavy = players[3].units[2];
				add(player4_heavy);
			}
		}

		_map.loadEntities(placeEntities, "entities");

	}

	public function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		if (entityName == "light1")
		{
			player1_light.x = x;
			player1_light.y = y;
		}

		else if (entityName == "medium1")
		{
			player1_medium.x = x;
			player1_medium.y = y;
		}

		else if (entityName == "heavy1")
		{
			player1_heavy.x = x;
			player1_heavy.y = y;
		}

		else if (entityName == "light2")
		{
			player2_light.x = x;
			player2_light.y = y;
		}

		else if (entityName == "medium2")
		{
			player2_medium.x = x;
			player2_medium.y = y;
		}

		else if (entityName == "heavy2")
		{
			player2_heavy.x = x;
			player2_heavy.y = y;
		}

		else if (entityName == "light3")
		{
			player3_light.x = x;
			player3_light.y = y;
		}

		else if (entityName == "medium3")
		{
			player3_medium.x = x;
			player3_medium.y = y;
		}

		else if (entityName == "heavy3")
		{
			player3_heavy.x = x;
			player3_heavy.y = y;
		}

		else if (entityName == "light4")
		{
			player4_light.x = x;
			player4_light.y = y;
		}

		else if (entityName == "medium4")
		{
			player4_medium.x = x;
			player4_medium.y = y;
		}

		else if (entityName == "heavy4")
		{
			player4_heavy.x = x;
			player4_heavy.y = y;
		}

	}

	function loadLevel1()
	{
		_map = new FlxOgmoLoader(AssetPaths.Foresttestlevel2__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tileset__png, 32, 32, "walls"); //loads map from walls layer
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE); //no collision with floor tiles
		_mWalls.setTileProperties(2, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(3, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(4, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(5, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(6, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(7, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(8, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(9, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(10, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(11, FlxObject.ANY); //collision with walls
		_mWalls.setTileProperties(12, FlxObject.ANY); //collision with walls
		add(_mWalls);
	}
}

