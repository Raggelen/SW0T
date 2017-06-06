package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import source.Player;
import flixel.math.FlxPoint;

class State_Game extends FlxState

{
	private var _player:Player;

	//private var 	_player1_light:Player;
	//private var	 	_player1_medium:Player;
	//private var 	_player1_heavy:Player;

	public var _map:FlxOgmoLoader;
	public var _mWalls:FlxTilemap;
	private var _movmentPoolCount:FlxText;

	override public function create():Void

	{
		FlxG.camera.bgColor = FlxColor.GRAY; // turns screen gray

		FlxG.camera.fade(FlxColor.BLACK, .5, true); //fade out while switching states

		loadLevel1();

		createPlayer();
		FlxG.camera.follow(_player, NO_DEAD_ZONE, 1); //follow the player using the topdown style with a lerp of 1 (camera smoothness)
		//FlxG.camera.follow(FlxG.mouse.getWorldPosition, NO_DEAD_ZONE, 1);
		FlxG.camera.zoom = 1 ; //camera zoom, duh
		
	
		movementPoolText();
	
		super.create();

	}

	public function movementPoolText()
	{

		_movmentPoolCount = new FlxText(0, 0, 0, Std.string(_player.movementPoints), 30);
		//_movmentPoolCount.alignment = CENTER;
		//_movmentPoolCount.screenCenter(X);
		add(_movmentPoolCount);
		//_movmentPoolCount.y = 20;
	
		trace("make movement pool text");          
	}

	function movementPoolUpdate()
	{
		_movmentPoolCount.text = Std.string(_player.movementPoints);
		_movmentPoolCount.x = _player.x + 20;
		_movmentPoolCount.y = _player.y + 20;
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

		//checkCollison();
		movementPoolUpdate(); 
		
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

		if (entityName == "player")
		{
			//_player1_light.x = x; // set player x coordinate
			//_player1_light.y = y; // set player y coordinate

			_player.x = x;
			_player.y = y;
		}
	}

	function loadLevel1()
	{
		_map = new FlxOgmoLoader(AssetPaths.Foresttestlevel__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tilesetForest__png, 32, 32, "walls"); //loads map from walls layer
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