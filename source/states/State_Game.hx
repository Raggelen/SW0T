package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import source.Player;
import flixel.math.FlxPoint;

class State_Game extends FlxState

{
	private var _player:Player;

	public var _map:FlxOgmoLoader;
	public var _mWalls:FlxTilemap;

	override public function create():Void

	{
		FlxG.camera.bgColor = FlxColor.GRAY; // turns screen gray

		FlxG.camera.fade(FlxColor.BLACK, .33, true); //fade out while switching states
		
		
		loadLevel1();
		
		createPlayer();
		FlxG.camera.follow(_player, TOPDOWN, 1); //follow the player using the topdown style with a lerp of 1 (camera smoothness) 
		FlxG.camera.zoom = 3 ; //camera zoom, duh
		
		super.create();

		
	}

	override public function update(elapsed:Float):Void

	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
	}

	function  createPlayer()

	{
		_player = new Player(200,200);
		//_map.loadEntities(placeEntities, "entities");
		add(_player);

	}
	/*

	public function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		if (entityName == "player")
		{
			_player.x = x; // set player x coordinate
			_player.y = y; // set player y coordinate
		}
	}
	*/
	function loadLevel1()
	{
		_map = new FlxOgmoLoader(AssetPaths.newlevel2__oel);
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
		 
		//_mWalls.x =  -200;
		//_mWalls.y = -50;
		
		//_mWalls.offset.set( -200, - 50);
		
	}

}