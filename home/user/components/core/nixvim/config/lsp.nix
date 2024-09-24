{ inputs
, pkgs
, ...
}: {
  plugins = {
    lsp-lines.enable = true;
    lsp-format.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        lua-ls.enable = true;
        nil-ls.enable = true;
        pyright.enable = true;
      };
      keymaps = {
        silent = true;
        lspBuf = { 
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Goto Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>rr" = {
            action = "rename";
            desc = "Rename";
          };
        };
      };
    };
    lspkind = {
      enable = true;
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
  extraConfigLua = let
    lsp-ai-llama-cpp = "${inputs.lsp-ai.packages.${pkgs.system}.lsp-ai-llama-cpp}/bin/lsp-ai";
  in ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    require('lspconfig.configs').lsp_ai = {
      default_config = {
        cmd = { '${lsp-ai-llama-cpp}' },
        filetypes = { 'html' },
        root_dir = vim.loop.cwd,
        init_options = {
          memory = {
            file_store = {}
          },
          models = {
            model1 = {
              type = "llama_cpp",
              file_path = "/home/user/Meta-Llama-3.1-8B-F16.gguf",
              n_ctx = 2048,
              n_gpu_layers = 0,
            }
          },
          completion = {
            model = "model1",
            parameters = {
              fim = {
                start = "<|fim_prefix|>",
                middle = "<|fim_suffix|>",
                ["end"] = "<|fim_middle|>",
              },
              max_context = 2000,
              max_new_tokens = 32,
            }
          }
        },
      },
    }

    require('lspconfig').lsp_ai.setup ({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  '';
}
