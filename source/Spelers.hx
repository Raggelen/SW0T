package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import states.State_Game;

/**
 * ...
 * @author Ramon Boelens
 */

class Spelers extends Sprite
{
	public var playerName : String;
	public var units : Array<Unit> = new Array();
	public var hasTurn : Int = 0; //0 is not players turn | 1 is players turn
	var tempType : String;
	var tempTypeNumber : Int;
	var imagePath : String;
	private var player_Number : Int = 0;
	public static var Temp_Var : Int = 0;
	
	
	public function new() 
	{
		super();
		assignUnitType();
	}
	
	
	
	/**
	 * Giving all the units their class
	 */
	function assignUnitType() {		
		for (i in 0 ... 3) {
			if (i == 0) {
				tempType = "light";
			}
			else if (i == 1) {
				tempType = "medium";
			}
			else if (i == 2) {
				tempType = "heavy";
			}
			assignUnits(tempType);
		}
	}
	
	/**
	 * Giving the units their proper values and storing them in an array called units
	 * @param	tempType
	 */
	function assignUnits(tempType : String) {		
		if (tempType == "light") {
			imagePath = AssetPaths.LightSpriteSheet__png;
			tempTypeNumber = 0;
		}
		else if (tempType == "medium") {
			imagePath = AssetPaths.MediumSpriteSheet__png;
			tempTypeNumber = 1;
		}
		else if (tempType == "heavy") {
			imagePath = AssetPaths.HeavySpriteSheet__png;
			tempTypeNumber = 2;
		}
		else {
			trace ("No such type");
		}
		
		if (Temp_Var == 3)
		{
			State_Game.Cur_Player_Number++;
			Temp_Var = 0;
		}
		Temp_Var++;
		
		player_Number = State_Game.Cur_Player_Number;
		var unit : Unit = new Unit(tempType, imagePath, player_Number);
		
		unit.type = tempType;
		//unit.alive = true;
		unit.typeNumber = tempTypeNumber;
		unit.imagePath = imagePath;
		units.push(unit);
	}	
	
	public function Return_Units()
	{
		return units;
	}
	
	public function Return_HasTurn()
	{
		return hasTurn;
	}
	
	
}