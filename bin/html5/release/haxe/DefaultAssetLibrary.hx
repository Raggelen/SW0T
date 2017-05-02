package;


import haxe.Timer;
import haxe.Unserializer;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.AssetType;
import lime.utils.Bytes;
import lime.utils.Log;

#if sys
import haxe.io.Path;
import sys.FileSystem;
#end


@:keep class DefaultAssetLibrary extends AssetLibrary {
	
	
	private var lastModified:Float;
	private var timer:Timer;
	
	#if (windows && !cs)
	private var rootPath = FileSystem.absolutePath (Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
	#else
	private var rootPath = "";
	#end
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		#end
		
		#if flash
		
		
		
		#elseif html5
		
		var id;
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in paths.keys()) {
				paths.set(k, assetsPrefix + paths[k]);
			}
		}
		
		for (id in paths.keys()) {
			preload.set (id, true);
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (false && Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				
				if (FileSystem.exists (path)) {
					
					lastModified = FileSystem.stat (path).mtime.getTime ();
					
					timer = new Timer (2000);
					timer.run = function () {
						
						var modified = FileSystem.stat (path).mtime.getTime ();
						
						if (modified > lastModified) {
							
							lastModified = modified;
							loadManifest ();
							
							onChange.dispatch ();
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var manifest = AssetManifest.fromFile ("app/native/manifest");
			#elseif tizen
			var manifest = AssetManifest.fromFile ("../res/manifest");
			#elseif emscripten
			var manifest = AssetManifest.fromFile ("assets/manifest");
			#elseif (mac && java)
			var manifest = AssetManifest.fromFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var manifest = AssetManifest.fromFile ("assets/manifest");
			#else
			var manifest = AssetManifest.fromFile ("manifest");
			#end
			
			if (manifest != null) {
				
				for (asset in manifest.assets) {
					
					if (!classTypes.exists (asset.id)) {
						
						#if (ios || tvos)
						paths.set (asset.id, rootPath + "assets/" + asset.path);
						#else
						paths.set (asset.id, rootPath + asset.path);
						#end
						types.set (asset.id, cast (asset.type, AssetType));
						
					}
					
				}
				
			} else {
				
				Log.warn ("Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			Log.warn ('Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
}


#if !display
#if flash



#elseif html5



#else



#if (windows || mac || linux || cpp)





#end
#end

#if (openfl && !flash)

#end

#end
