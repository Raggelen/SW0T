package;

import openfl.display.Sprite;

/**
 * ...
 * @author Ramon Boelens
 */

class Spelers extends Sprite
{
	public var playerName : String;
	public var units : Array<Unit> = new Array();
	public var hasTurn : Bool = false;
	var tempType : String;
	var imagePath : String;
	
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
			imagePath = AssetPaths.Light__png;
		}
		else if (tempType == "medium") {
			imagePath = AssetPaths.Medium__png;
		}
		else if (tempType == "heavy") {
			imagePath = AssetPaths.Heavy__png;
		}
		else {
			trace ("No such type");
		}
		
		var unit : Unit = new Unit(tempType, 1, imagePath);
		unit.type = tempType;
		//unit.alive = true;
		unit.position = 1;
		unit.imagePath = imagePath;
		units.push(unit);
	}	
}