{
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
  extraConfigLua = ''
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
  '';
}
