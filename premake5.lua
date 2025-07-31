project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    targetdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textdit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp",
        "imgui_tables.cpp"                --For the newly "table" functions which introduced form ImGui v1.73

        --"imgui_impl_glfw.h",
        --"imgui_impl_glfw.cpp",
        --"imgui_impl_opengl3_loader.h",
        --"imgui_impl_opengl3.h",
        --"imgui_impl_opengl3.cpp"
    }

    --includedirs	-- 项目的附加包含目录
	--{
	--	"../GLFW/include",
    --}

    filter "system:windows"
        systemversion "latest"

        defines
        {
            "IMGUI_API=__declspec(dllexport)"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
