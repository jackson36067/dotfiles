-- lua/plugins/leetcode.lua
return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- 将默认语言改为 java
    lang = "java",

    storage = {
      -- 将路径改为用户目录下的 LeetCode 文件夹
      home = vim.fn.expand("$HOME") .. "/LeetCode",
    },

    domain = "cn",
    cn = {
      enabled = true,
      translator = true, -- 如果某些部分没翻译，尝试开启翻译器
      translate_problems = true,
    },
  },
}
