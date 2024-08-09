project "GLFW3"
    kind "StaticLib"
    language "C"
	staticruntime "on"
	
	targetname "GLFW3"  -- Set the target name to GLFW3

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
		"src/**.h",
		"src/**.c"
    }

    filter "system:windows"
        systemversion "latest"
        defines { "_GLFW_WIN32" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
		
	filter { "system:windows", "configurations:Debug" }
        buildoptions "/MTd"
	
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"