-- scaffold geniefile for semimap

semimap_script = path.getabsolute(path.getdirectory(_SCRIPT))
semimap_root = path.join(semimap_script, "semimap")

semimap_includedirs = {
	path.join(semimap_script, "config"),
	semimap_root,
}

semimap_libdirs = {}
semimap_links = {}
semimap_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { semimap_includedirs }
	end,

	_add_defines = function()
		defines { semimap_defines }
	end,

	_add_libdirs = function()
		libdirs { semimap_libdirs }
	end,

	_add_external_links = function()
		links { semimap_links }
	end,

	_add_self_links = function()
		links { "semimap" }
	end,

	_create_projects = function()

project "semimap"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		semimap_includedirs,
	}

	defines {}

	files {
		path.join(semimap_script, "config", "**.h"),
		path.join(semimap_root, "**.h"),
		path.join(semimap_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
