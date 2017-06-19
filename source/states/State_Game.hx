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
import flixel.math.FlxPoint;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.input.FlxInput;
import flixel.addons.ui.FlxButtonPlus;
import flixel.ui.FlxButton;
import flixel.addons.tile.FlxRayCastTilemap;

import Spelers;
import Sounds;

class State_Game extends FlxState

{
	var playerTurn : Int = 0;
	var selectedUnit : Int;

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
	
	var sounds : Sounds = new Sounds();

	public var unit : Unit;
	public static var players : Array<Spelers> = new Array();
	var shooting : Shooting;

	public var _map:FlxOgmoLoader;
	public var _mWalls:FlxTilemap;
	
	public static var movementPoints : Int = 6;
	
	private var _btnPlay:FlxButtonPlus;
	
	public static var Cur_Player_Number = 0;
	
	override public function create():Void
	{
		FlxG.camera.bgColor = FlxColor.GRAY; // turns screen gray

		FlxG.camera.fade(FlxColor.BLACK, .5, true); //fade out while switching states

		loadLevel1();
		Set_Players();
		createPlayers();

		//FlxG.camera.follow(_player, NO_DEAD_ZONE, 1); //follow the player using the topdown style with a lerp of 1 (camera smoothness)

		FlxG.camera.zoom = 1 ; //camera zoom, duh
		
		_btnPlay = new FlxButtonPlus(0, 0, nextTurn, "next turn", 100, 50); //creates a button at (0,0) that says play, and calls function 'clickPlay'
		_btnPlay.x = (FlxG.width / 2) - _btnPlay.width - 10;
		_btnPlay.y = FlxG.height - _btnPlay.height - 50;
		add(_btnPlay);
		
		var btn_up = new FlxButton(1430, 160, "Up", onUp);
		var btn_down = new FlxButton(1430, 190, "Down", onDown);
		var btn_left = new FlxButton(1350, 190, "Left", onLeft);
		var btn_right = new FlxButton(1510, 190, "Right", onRight);
		
		add(btn_up);
		add(btn_down);
		add(btn_left);
		add(btn_right);
		
		shooting = new Shooting(this);
		var btn_shoot = new FlxButton(1430, 250, "Fire", onFire); 
		add(btn_shoot);
		
		super.create();
	}
	
	function onUp()
	{
		if (selectedUnit == null)
		{
			trace("None selected");
		}
		else
		{
			players[playerTurn].units[selectedUnit].onUp();
		}
	}
	
	function onDown()
	{
		if (selectedUnit == null)
		{
			trace("None selected");
		}
		else
		{
			players[playerTurn].units[selectedUnit].onDown();
		}
	}
	
	function onLeft()
	{
		if (selectedUnit == null)
		{
			trace("None selected");
		}
		else
		{
			players[playerTurn].units[selectedUnit].onLeft();
		}
	}
	
	function onRight()
	{
		if (selectedUnit == null)
		{
			trace("None selected");
		}
		else
		{
			players[playerTurn].units[selectedUnit].onRight();
		}
	}
	
	function onFire()
	{
		shooting.shoot();
	}
	
	function nextTurn()
	{
		if (movementPoints != 6) {
			
			players[playerTurn].hasTurn = 0;
			
			if (playerTurn == 3)
			{
				playerTurn = 0;
				players[playerTurn].hasTurn = 1;
				movementPoints = 6;
			}
			else
			{
				playerTurn ++;
				players[playerTurn].hasTurn = 1;
				movementPoints = 6;
			}
		}
		
		else
		{
			trace("You need to spend at least one action point");
		}
		
		
		trace(playerTurn);
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.collide(player1_light, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player2_light, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player3_light, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player4_light, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player1_medium, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player2_medium, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player3_medium, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player4_medium, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player1_heavy, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player2_heavy, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player3_heavy, _mWalls))
		{
			movementPoints ++;
		}
		else if (FlxG.collide(player4_heavy, _mWalls))
		{
			movementPoints ++;
		}
		//FlxG.camera.shake(0.01, 0.2); //camera shake, for when a unit dies?

		if (FlxG.mouse.wheel != 0)
		{
			// Mouse wheel logic goes here, for example zooming in / out:
			FlxG.camera.zoom += (FlxG.mouse.wheel / 10);
		}
		
		super.update(elapsed);
	}
	
	public function Set_Players()
	{
		//for (i in 0 ... 3)
		//{
			//var player : Spelers = new Spelers();
			//player.playerName = "Player " + i;
			//players.push(player);
		//}
		
		var player : Spelers = new Spelers();
		player.playerName = "Player 1";
		players.push(player);
		
		var player : Spelers = new Spelers();
		player.playerName = "Player 2";
		players.push(player);
		
		var player : Spelers = new Spelers();
		player.playerName = "Player 3";
		players.push(player);
		
		var player : Spelers = new Spelers();
		player.playerName = "Player 4";
		players.push(player);
		
		if (playerTurn == 0)
		{
			players[playerTurn].hasTurn = 1;
		}
		if (playerTurn == 1)
		{
			players[playerTurn].hasTurn = 1;
		}
		if (playerTurn == 2)
		{
			players[playerTurn].hasTurn = 1;
		}
		if (playerTurn == 3)
		{
			players[playerTurn].hasTurn = 1;
		}
	}
	
	function createPlayers()
	{
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
			FlxMouseEventManager.add(player1_light, onMouseDown_0_0, null, null, null);
		}

		else if (entityName == "medium1")
		{
			player1_medium.x = x;
			player1_medium.y = y;
			FlxMouseEventManager.add(player1_medium, onMouseDown_0_1, null, null, null);
		}

		else if (entityName == "heavy1")
		{
			player1_heavy.x = x;
			player1_heavy.y = y;
			FlxMouseEventManager.add(player1_heavy, onMouseDown_0_2, null, null, null);
		}

		else if (entityName == "light2")
		{
			player2_light.x = x;
			player2_light.y = y;
			FlxMouseEventManager.add(player2_light, onMouseDown_1_0, null, null, null);
		}

		else if (entityName == "medium2")
		{
			player2_medium.x = x;
			player2_medium.y = y;
			FlxMouseEventManager.add(player2_medium, onMouseDown_1_1, null, null, null);
		}

		else if (entityName == "heavy2")
		{
			player2_heavy.x = x;
			player2_heavy.y = y;
			FlxMouseEventManager.add(player2_heavy, onMouseDown_1_2, null, null, null);
		}

		else if (entityName == "light3")
		{
			player3_light.x = x;
			player3_light.y = y;
			FlxMouseEventManager.add(player3_light, onMouseDown_2_0, null, null, null);
		}

		else if (entityName == "medium3")
		{
			player3_medium.x = x;
			player3_medium.y = y;
			FlxMouseEventManager.add(player3_medium, onMouseDown_2_1, null, null, null);
		}

		else if (entityName == "heavy3")
		{
			player3_heavy.x = x;
			player3_heavy.y = y;
			FlxMouseEventManager.add(player3_heavy, onMouseDown_2_2, null, null, null);
		}

		else if (entityName == "light4")
		{
			player4_light.x = x;
			player4_light.y = y;
			FlxMouseEventManager.add(player4_light, onMouseDown_3_0, null, null, null);
		}

		else if (entityName == "medium4")
		{
			player4_medium.x = x;
			player4_medium.y = y;
			FlxMouseEventManager.add(player4_medium, onMouseDown_3_1, null, null, null);
		}

		else if (entityName == "heavy4")
		{
			player4_heavy.x = x;
			player4_heavy.y = y;
			FlxMouseEventManager.add(player4_heavy, onMouseDown_3_2, null, null, null);
		}

	}
	
	function unselectUnits()
	{
		for (unit in State_Game.players[0].units)
		{
			unit.selected = 0;
		}
		for (unit in State_Game.players[1].units)
		{
			unit.selected = 0;
		}
		for (unit in State_Game.players[2].units)
		{
			unit.selected = 0;
		}
		for (unit in State_Game.players[3].units)
		{
			unit.selected = 0;
		}
	}
	
	function onMouseDown_0_0(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[0].units[0].selected = 1;
		
		if (playerTurn == 0)
		{
			selectedUnit = players[0].units[0].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_0_1(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[0].units[1].selected = 1;
		if (playerTurn == 0)
		{
			selectedUnit = players[0].units[1].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_0_2(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[0].units[2].selected = 1;
		if (playerTurn == 0)
		{
			selectedUnit = players[0].units[2].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_1_0(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[1].units[0].selected = 1;
		if (playerTurn == 1)
		{
			selectedUnit = players[1].units[0].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_1_1(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[1].units[1].selected = 1;
		if (playerTurn == 1)
		{
			selectedUnit = players[1].units[1].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_1_2(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[1].units[2].selected = 1;
		if (playerTurn == 1)
		{
			selectedUnit = players[1].units[2].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_2_0(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[2].units[0].selected = 1;
		if (playerTurn == 2)
		{
			selectedUnit = players[2].units[0].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_2_1(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[2].units[1].selected = 1;
		if (playerTurn == 2)
		{
			selectedUnit = players[2].units[1].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_2_2(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[2].units[2].selected = 1;
		if (playerTurn == 2)
		{
			selectedUnit = players[2].units[2].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_3_0(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[3].units[0].selected = 1;
		if (playerTurn == 3)
		{
			selectedUnit = players[3].units[0].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_3_1(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[3].units[1].selected = 1;
		if (playerTurn == 3)
		{
			selectedUnit = players[3].units[1].typeNumber;
			sounds.Inpos();
		}
	}
	
	function onMouseDown_3_2(Sprite: FlxSprite)
	{		
		unselectUnits();
		
		players[3].units[2].selected = 1;
		if (playerTurn == 3)
		{
			selectedUnit = players[3].units[2].typeNumber;
			sounds.Inpos();
		}
	}

	function loadLevel1()
	{
		_map = new FlxOgmoLoader(AssetPaths.Foresttestlevel2__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tileset__png, 32, 32, "walls"); //loads map from walls layer
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE); //no collision with floor tiles
		_mWalls.setTileProperties(13, FlxObject.NONE); //no collision with floor tiles
		_mWalls.setTileProperties(14, FlxObject.NONE); //no collision with floor tiles
		_mWalls.setTileProperties(15, FlxObject.NONE); //no collision with floor tiles
		
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
	
	public static function Return_Player_hasTurn(Selected_Player : Int)
	{
		return players[Selected_Player].Return_HasTurn();
	}
	
	public function Return_Movement()
	{
		return movementPoints;
	}
	
	public function Return_SelectedUnit()
	{
		return selectedUnit;
	}
	
	public function Return_Map()
	{
		return _mWalls;
	}
	
	public function Return_Players()
	{
		return players;
	}
	
	public function Return_PlayersTurn()
	{
		return playerTurn;
	}
	
	public function Return_Unit()
	{
		return players[playerTurn].units[selectedUnit];
	}
}