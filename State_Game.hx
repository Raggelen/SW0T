package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import source.Player;
import flixel.math.FlxPoint;
import Spelers;

class State_Game extends FlxState

{
	private var _player:Player;

	//private var 	_player1_light:Player;
	//private var	 	_player1_medium:Player;
	//private var 	_player1_heavy:Player;
	var unit : Unit;
	var players : Array<Spelers> = new Array();



	public var _map:FlxOgmoLoader;
	public var _mWalls:FlxTilemap;

	override public function create():Void

	{
		FlxG.camera.bgColor = FlxColor.GRAY; // turns screen gray

		FlxG.camera.fade(FlxColor.BLACK, .5, true); //fade out while switching states

		loadLevel1();
		createPlayers();

		createPlayer();
		FlxG.camera.follow(_player, NO_DEAD_ZONE, 1); //follow the player using the topdown style with a lerp of 1 (camera smoothness)
		//FlxG.camera.follow(FlxG.mouse.getWorldPosition, NO_DEAD_ZONE, 1);
		FlxG.camera.zoom = 1 ; //camera zoom, duh

		super.create();

	}

	override public function update(elapsed:Float):Void

	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
		//FlxG.camera.shake(0.01, 0.2); //camera shake, for when a unit dies?

		if (FlxG.mouse.wheel != 0)
		{
			// Mouse wheel logic goes here, for example zooming in / out:
			FlxG.camera.zoom += (FlxG.mouse.wheel / 10);
		}
	}

	function  createPlayer()

	{
		//_player = new Player(200,200);
		_player = new Player();
		//_player1_light = new Player();
		//_player1_medium = new Player();
		//_player1_heavy = new Player();

		_map.loadEntities(placeEntities, "entities");
		add(_player);

	}

	public function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		if (entityName == "NewObject0")
		{
			//_player1_light.x = x; // set player x coordinate
			//_player1_light.y = y; // set player y coordinate

			_player.x = x;
			_player.y = y;
		}
	}

	function loadLevel1()
	{
		_map = new FlxOgmoLoader(AssetPaths.newlevel3__oel);
		_mWalls = _map.loadTilemap(AssetPaths.Tileset1__png, 16, 16, "Walls"); //loads map from walls layer
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
	
	function createPlayers() 
	{
		for (i in 0 ... 4) {
			var player : Spelers = new Spelers();
			player.playerName = "Player " + i;
			players.push(player);
			trace(players[0].units[2].type);
	}
	}
}