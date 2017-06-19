package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;
import flixel.math.FlxPoint;

import states.State_Game;

import Sounds;

/**
 * ...
 * @author Ramon Boelens
 */

class Shooting extends FlxSprite
{
	
	var game : State_Game;
	var sounds : Sounds = new Sounds();
	
	var players : Array<Spelers>;
	var playerTurn : Int;
	var selectedUnit : Int;
	
	var unitPosX : Float;
	var unitPosY : Float;
	
	var endPosX : Float;
	var endPosY : Float;
	
	var _mWalls : FlxTilemap;
	
	public function new(TheGameScreen:State_Game) 
	{
		super();
		game = TheGameScreen;
	}
	
	public function shoot()
	{
		var unit : Int = game.Return_SelectedUnit();
		
		if (unit == 0)
		{
			rayCast();
			sounds.takingShotLight();
		}
		
		else if (unit == 1)
		{
			rayCast();
			sounds.takingShotMedium();
		}
		
		else if (unit == 2)
		{
			rayCast();
			sounds.takingShotHeavy();
		}
		
		else
		{
			trace("No unit selected");
		}
	}
	
	function rayCast()
	{
		/**
		 * Retrieving all the information it needs from the state_game to perform the raycast
		 * 
		 * _mWalls = the map itself
		 * players = the array with players
		 * playerTurn = the number of the players whose turn it is
		 * selectedUnit = the unit the player did select
		 * facing = the direction the unit is looking at
		 */
		_mWalls = game.Return_Map();
		players = game.Return_Players();
		playerTurn = game.Return_PlayersTurn();
		selectedUnit = game.Return_SelectedUnit();
		
		var facing = players[playerTurn].units[selectedUnit].return_FacingDirection();
		
		getPositions();
		
		if (selectedUnit == 0)
		{
			switch(facing)
			{
				case FlxObject.UP:
					endPosX = unitPosX;
					endPosY = unitPosY - 4000;
				case FlxObject.DOWN:
					endPosX = unitPosX;
					endPosY = unitPosY + 4000;
				case FlxObject.LEFT:
					endPosX = unitPosX - 4000;
					endPosY = unitPosY;
				case FlxObject.RIGHT:
					endPosX = unitPosX + 4000;
					endPosY = unitPosY;
			}
			
			trace("Light unit shoots");
		}
		else if (selectedUnit == 1)
		{
			switch(facing)
			{	
				case FlxObject.UP:
					endPosX = unitPosX + 4000;
					endPosY = unitPosY + 4000;
				case FlxObject.DOWN:
					endPosX = unitPosX - 4000;
					endPosY = unitPosY - 4000;
				case FlxObject.LEFT:
					endPosX = unitPosX + 4000;
					endPosY = unitPosY + 4000;
				case FlxObject.RIGHT:
					endPosX = unitPosX - 4000;
					endPosY = unitPosY - 4000;
			}
			
			trace("Medium unit shoots");
		}
		else
		{
			//switch(facing)
			//{	
				//case FlxObject.UP:
					//endPosX = unitPosX + 4000;
					//endPosY = unitPosY + 4000;
				//case FlxObject.DOWN:
					//endPosX = unitPosX - 4000;
					//endPosY = unitPosY - 4000;
				//case FlxObject.LEFT:
					//endPosX = unitPosX + 4000;
					//endPosY = unitPosY + 4000;
				//case FlxObject.RIGHT:
					//endPosX = unitPosX - 4000;
					//endPosY = unitPosY - 4000;
			//}
			
			trace("Heavy unit shoots");
		}
		
		var start : FlxPoint = new FlxPoint(unitPosX, unitPosY);
		var end : FlxPoint = new FlxPoint(endPosX, endPosY);
		var result : FlxPoint = new FlxPoint(0, 0);
		
		_mWalls.ray(start, end, result);
		
		trace(result);
	}
	
	/**
	 * Retrieving the position(X, Y) of the selected unit
	 */
	function getPositions()
	{
		unitPosX = players[playerTurn].units[selectedUnit].returnPosX();
		unitPosY = players[playerTurn].units[selectedUnit].returnPosY();
	}
}