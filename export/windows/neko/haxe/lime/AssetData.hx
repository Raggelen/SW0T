package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level1/Foresttestlevel.oel", "assets/data/Level1/Foresttestlevel.oel");
			type.set ("assets/data/Level1/Foresttestlevel.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level1/Foresttestlevel2.oel", "assets/data/Level1/Foresttestlevel2.oel");
			type.set ("assets/data/Level1/Foresttestlevel2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level1/Foresttestlevel2image.png", "assets/data/Level1/Foresttestlevel2image.png");
			type.set ("assets/data/Level1/Foresttestlevel2image.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/Level1/Foresttestlevelimage.png", "assets/data/Level1/Foresttestlevelimage.png");
			type.set ("assets/data/Level1/Foresttestlevelimage.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/Levels.oep", "assets/data/Levels.oep");
			type.set ("assets/data/Levels.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/SW0TLEVELS.oep", "assets/data/SW0TLEVELS.oep");
			type.set ("assets/data/SW0TLEVELS.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/TestLevels/TestLevel/TestLevel.oel", "assets/data/TestLevels/TestLevel/TestLevel.oel");
			type.set ("assets/data/TestLevels/TestLevel/TestLevel.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/TestLevels/TestLevel/TestLevel.png", "assets/data/TestLevels/TestLevel/TestLevel.png");
			type.set ("assets/data/TestLevels/TestLevel/TestLevel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/TestLevels/TestLevel2/TestLevel2.oel", "assets/data/TestLevels/TestLevel2/TestLevel2.oel");
			type.set ("assets/data/TestLevels/TestLevel2/TestLevel2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/TestLevels/TestLevel2/TestLevel2.png", "assets/data/TestLevels/TestLevel2/TestLevel2.png");
			type.set ("assets/data/TestLevels/TestLevel2/TestLevel2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bannerUnit.png", "assets/images/bannerUnit.png");
			type.set ("assets/images/bannerUnit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Heavy.png", "assets/images/Heavy.png");
			type.set ("assets/images/Heavy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/HeavySpriteSheet.png", "assets/images/HeavySpriteSheet.png");
			type.set ("assets/images/HeavySpriteSheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Light.png", "assets/images/Light.png");
			type.set ("assets/images/Light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Medium.png", "assets/images/Medium.png");
			type.set ("assets/images/Medium.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/menuScreen.png", "assets/images/menuScreen.png");
			type.set ("assets/images/menuScreen.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tileset.png", "assets/images/tileset.png");
			type.set ("assets/images/tileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tileset1.png", "assets/images/Tileset1.png");
			type.set ("assets/images/Tileset1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilesetForest.png", "assets/images/tilesetForest.png");
			type.set ("assets/images/tilesetForest.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/WallTile.jpg", "assets/images/WallTile.jpg");
			type.set ("assets/images/WallTile.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/HaxeFlixel_Tutorial_Game.mp3", "assets/music/HaxeFlixel_Tutorial_Game.mp3");
			type.set ("assets/music/HaxeFlixel_Tutorial_Game.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
