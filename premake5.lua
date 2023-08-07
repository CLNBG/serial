project "libSerial"
    cppdialect "C++17"
    kind "StaticLib"
    language "C++"


    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    includedirs 
    {
        "include",
        "src"
    }

    files
    {
        "src/serial.cpp",
        "src/impl/win.cpp",
        "src/impl/list_ports/list_ports_win.cpp",
        "include/serial/serial.h",
        "include/serial/v8stdint.h",
        "include/serial/impl/win.h"
    }

    links
    {
        "setupapi.lib"
    }
    
    filter "system:windows"
        systemversion "latest"
        staticruntime "Off"


    filter "configurations:Debug"
        systemversion "latest"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        systemversion "latest"
        runtime "Release"
        optimize "on"
