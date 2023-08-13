require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    cpp = {
      "cd $dir &&",
      "clang++ -std=c++20 $fileName",
      "-o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt",
    },
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
  },
})
