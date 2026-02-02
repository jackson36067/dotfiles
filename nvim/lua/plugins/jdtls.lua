return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return
        end

        local lombok_path = vim.fn.expand("~/.m2/repository/org/projectlombok/lombok/1.18.32/lombok-1.18.32.jar")

        require("jdtls").start_or_attach({
          cmd = { "jdtls", "--jvm-arg=-javaagent:" .. lombok_path },
          root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        })
      end,
    })
    local jdtls_config = {
      bundles = {},
    }
    vim.list_extend(jdtls_config.bundles, require("spring_boot").java_extensions())
  end,
}
