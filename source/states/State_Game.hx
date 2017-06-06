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

	//private var 	_player1_light:Player;
	//private var	 	_player1_medium:Player;
	//private var 	_player1_heavy:Player;
	var unit : Unit;
	var players : Array<Spelers> = new Array();



	public var _map:FlxOgmoLoader;
	public var _mWalls:FlxTilemap;
	private var _movmentPoolCount:FlxText;

	override public function create():Void

	{
		FlxG.camera.bgColor = FlxColor.GRAY; // turns screen gray

		FlxG.camera.fade(FlxColor.BLACK, .5, true); //fade out while switching states

		loadLevel1();
		createPlayers();
		
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

<<<<<<< HEAD
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
=======
	function  createPlayers()
>>>>>>> origin/Units-spawning
	{
		for (i in 0 ... 4) {
			var player : Spelers = new Spelers();
			player.playerName = "Player " + i;
			players.push(player);
		}
		
		for (unit in players[0].units) {
			if (unit.type == "light") {
				trace("P1: Light unit");
				player1_light = players[0].units[0];
				add(player1_light);
			}
			else if (unit.type == "medium") {
				trace("P1: Medium unit");
				player1_medium = players[0].units[1];
				add(player1_medium);
			}
			else if (unit.type == "heavy") {
				trace("P1: Heavy unit");
				player1_heavy = players[0].units[2];
				add(player1_heavy);
			}
		}
		
		for (unit in players[1].units) {
			if (unit.type == "light") {
				trace("P2: Light unit");
				player2_light = players[1].units[0];
				add(player2_light);
			}
			else if (unit.type == "medium") {
				trace("P2: Medium unit");
				player2_medium = players[1].units[1];
				add(player2_medium);
			}
			else if (unit.type == "heavy") {
				trace("P2: Heavy unit");
				player2_heavy = players[1].units[2];
				add(player2_heavy);
			}
		}
		
		for (unit in players[2].units) {
			if (unit.type == "light") {
				trace("P3: Light unit");
				player3_light = players[2].units[0];
				add(player3_light);
			}
			else if (unit.type == "medium") {
				trace("P3: Medium unit");
				player3_medium = players[2].units[1];
				add(player3_medium);
			}
			else if (unit.type == "heavy") {
				trace("P3: Heavy unit");
				player3_heavy = players[2].units[2];
				add(player3_heavy);
			}
		}
		
		for (unit in players[3].units) {
			if (unit.type == "light") {
				trace("P4: Light unit");
				player4_light = players[3].units[0];
				add(player4_light);
			}
			else if (unit.type == "medium") {
				trace("P4: Medium unit");
				player4_medium = players[3].units[1];
				add(player4_medium);
			}
			else if (unit.type == "heavy") {
				trace("P4: Heavy unit");
				player4_heavy = players[3].units[2];
				add(player4_heavy);
			}
		}
		
		//_player = new Player(200,200);
		_player = new Player();
		//_player1_light = new Player();
		//_player1_medium = new Player();
		//_player1_heavy = new Player();
		
		_map.loadEntities(placeEntities, "entities");
		//add(_player);

	}

	public function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
<<<<<<< HEAD

		if (entityName == "player")
		{
			//_player1_light.x = x; // set player x coordinate
			//_player1_light.y = y; // set player y coordinate

			_player.x = x;
			_player.y = y;
=======
		
		if (entityName == "light1")
		{			
			player1_light.x = x;
			player1_light.y = y;
>>>>>>> origin/Units-spawning
		}
		
		else if (entityName == "medium1"){
			player1_medium.x = x;
			player1_medium.y = y;
		}
		
		else if (entityName == "heavy1"){
			player1_heavy.x = x;
			player1_heavy.y = y;
		}
		
		else if (entityName == "light2")
		{			
			player2_light.x = x;
			player2_light.y = y;
		}
		
		else if (entityName == "medium2"){
			player2_medium.x = x;
			player2_medium.y = y;
		}
		
		else if (entityName == "heavy2"){
			player2_heavy.x = x;
			player2_heavy.y = y;
		}
		
		else if (entityName == "light3")
		{			
			player3_light.x = x;
			player3_light.y = y;
		}
		
		else if (entityName == "medium3"){
			player3_medium.x = x;
			player3_medium.y = y;
		}
		
		else if (entityName == "heavy3"){
			player3_heavy.x = x;
			player3_heavy.y = y;
		}
		
		else if (entityName == "light4")
		{			
			player4_light.x = x;
			player4_light.y = y;
		}
		
		else if (entityName == "medium4"){
			player4_medium.x = x;
			player4_medium.y = y;
		}
		
		else if (entityName == "heavy4"){
			player4_heavy.x = x;
			player4_heavy.y = y;
		}
		
		
		//for (unit in players.units) {
		//	trace (unit);
		//}
	}

	function loadLevel1()
	{
<<<<<<< HEAD
		_map = new FlxOgmoLoader(AssetPaths.Foresttestlevel__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tilesetForest__png, 32, 32, "walls"); //loads map from walls layer
=======
		_map = new FlxOgmoLoader(AssetPaths.Foresttestlevel2__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tileset__png, 32, 32, "walls"); //loads map from walls layer
>>>>>>> origin/Units-spawning
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