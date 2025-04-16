local is_windows = vim.fn.has('win32') == 1

return {
    -- cmake
    {
        "Civitasv/cmake-tools.nvim",
        opts = function()
            local cmake_tools_kits_path = nil
            local cmake_toolchainfile_path = nil
            if is_windows then
                cmake_tools_kits_path = os.getenv("USERPROFILE") .. "\\.config\\cmake_tools_kits.json"
                cmake_toolchainfile_path = "C:/vcpkg/scripts/buildsystems/vcpkg.cmake"
            else
                cmake_tools_kits_path = os.getenv("HOME") .. "/.config/cmake_tools_kits.json"
                cmake_toolchainfile_path = "~/vcpkg/scripts/buildsystems/vcpkg.cmake"
            end

            return {
                cmake_command = "cmake",
                ctest_command = "ctest",
                cmake_use_preset = false,
                cmake_generate_on_save = true,
                cmake_generate_options = {
                    "-DCMAKE_TOOLCHAIN_FILE=" .. cmake_toolchainfile_path,
                    "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
                },
                cmake_build_options = {},
                cmake_build_directory = "build",
                cmake_build_type = "RelWithDebInfo",
                cmake_virtual_text_support = true,
                build_args = {
                    "-j8",
                },
                cmake_kits_path = cmake_tools_kits_path
            }
        end,
        config = function(_, opts)
            require("cmake-tools").setup(opts)
            local wk = require("which-key")
            wk.add({
                { "<leader>c",   group = "CMake \u{e794}" },

                { "<leader>cb",  "<cmd>CMakeBuild<cr>",             desc = "Build" },
                { "<leader>cB",  "<cmd>CMakeBuildCurrentFile<cr>",  desc = "Build current file" },
                { "<leader>cc",  "<cmd>CMakeClean<cr>",             desc = "Clean" },
                { "<leader>cg",  "<cmd>CMakeGenerate<cr>",          desc = "Generate" },

                { "<leader>cs",  group = "Select" },
                { "<leader>csk", "<cmd>CMakeSelectKit<cr>",         desc = "Select tool kit" },
                { "<leader>cst", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select build target" },
                { "<leader>csT", "<cmd>CMakeSelectKit<cr>",         desc = "Select build type" },
                { "<leader>csw", "<cmd>CMakeSelectCwd<cr>",         desc = "Select current workspace" }
            })
        end
    },
}
