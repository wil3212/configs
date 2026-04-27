# NVIM

# Config file setup plan from gemini...
    ~/.config/nvim/
    ├── init.lua              # The main entry point (now very small)
    ├── lua/
    │   ├── config/           # Your core Neovim settings
    │   │   ├── options.lua   # vim.opt stuff
    │   │   ├── keymaps.lua   # Your custom shortcuts
    │   │   └── autocmds.lua  # Macros, time-stamping, specific behaviors
    │   └── plugins/          # Plugin specifications
    │       └── vimwiki.lua   # Everything related to Vimwiki


* Sobre sudo nvim...:
    1. add `export SUDO_EDITOR="nvim"` to .bashrc
    2. use `sudoedit file`
    
# **Complete .bashrc:**
    export VISUAL="nvim"
    export EDITOR="nvim"
    export SUDO_EDITOR="nvim"
    

# **sudo write:**
    :w !sudo tee % > /dev/null
